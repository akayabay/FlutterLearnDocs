// ignore_for_file: unused_field

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/service/post_model.dart';
import 'package:flutter_full_learn/202/service/post_service.dart';

class ServicePostLearnView extends StatefulWidget {
  const ServicePostLearnView({super.key});

  @override
  State<ServicePostLearnView> createState() => _ServiceLearnViewState();
}

class _ServiceLearnViewState extends State<ServicePostLearnView> {
  // Servis datasını tutacak array
  // Servisten her zaman null değer dönebileceği için nullable

  String? _name;
  List<PostModel>? _items;
  bool _isLoading = false;
  late final Dio _dio;
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/';
  late bool _postService;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();
  TextEditingController _userIdController = TextEditingController();

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToServiceEasyLevel(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);

    if (response.statusCode == HttpStatus.created) {
      _name = 'Basarili';
    }
    _changeLoading();
  }

  Future<void> _addItemToServiceAdvance(PostModel postModel) async {
    _changeLoading();
    _postService = await PostService().addItemToService(postModel);
    if (_postService) {
      _changeLoading();
    }
  }

  // initState ile async,await gibi yapılar kullanılamaz
  // runtimeda çalışır ve biter
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink(),
            const SizedBox(width: 3),
            _isLoading ? const Icon(Icons.done) : const Icon(Icons.question_mark),
          ],
        ),
        body: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'Title'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _bodyController,
              decoration: const InputDecoration(hintText: 'Body'),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(hintText: 'User ID'),
              keyboardType: TextInputType.number,
            ),
            TextButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        if (_titleController.text.isNotEmpty &&
                            _bodyController.text.isNotEmpty &&
                            _userIdController.text.isNotEmpty) {
                          final PostModel model = PostModel(
                              title: _titleController.text,
                              body: _bodyController.text,
                              id: int.tryParse(_userIdController.text));
                          _addItemToServiceAdvance(model);
                          _titleController.clear();
                          _bodyController.clear();
                          _userIdController.clear();
                        }
                      },
                child: const Text('Send')),
            Text(_name ?? ''),
          ],
        ));
  }
}
