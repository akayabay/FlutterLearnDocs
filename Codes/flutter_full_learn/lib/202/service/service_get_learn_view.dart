// ignore_for_file: unused_field

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/comment_learn_view.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class ServiceGetLearnView extends StatefulWidget {
  const ServiceGetLearnView({super.key});

  @override
  State<ServiceGetLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServiceGetLearnView> {
  // Servis datasını tutacak array
  // Servisten her zaman null değer dönebileceği için nullable

  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  // Interface sayesinde artık test edilebilir kod yazılabiliyor
  late final IPostService _postService;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    // Her request için bir dio oluşturmak doğru bir haraket değil
    // Network requestler 1 tane instancedan olması lazım ve 1 kere gelmesi lazım
    // Bunun için baseurl ile bir dio tipinden _networkManager oluşturduk
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');

    // İlk olarak bu işlem başarılı mı?
    if (response.statusCode == HttpStatus.ok) {
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
      }
      _changeLoading();
    }
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  // initState ile async,await gibi yapılar kullanılamaz
  // runtimeda çalışır ve biter
  @override
  void initState() {
    super.initState();
    _postService = PostService();
    fetchPostItemsAdvance();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink(),
          ],
        ),
        body: _items == null
            ? const Placeholder()
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                // Length nullsa ? bunu belirtir, ?? ifadesiyle null değer geldiğinde ne göstereceğimizi handle ederiz
                // ?? ifadesi verilmezsse sonsuz döndürür
                itemCount: _items?.length ?? 0, // item sayım nullsa bu değeri 0 al
                itemBuilder: (context, index) {
                  return _PostCard(model: _items?[index]);
                },
              ));
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentLearnView(postId: _model?.id),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
