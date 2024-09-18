// ignore_for_file: unused_field

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_full_learn/202/service/comment_model.dart';
import 'post_model.dart';

// Interface
// Ya ben bu metodları kapatıyımda insanlar sadece interface üzerinden erişsin
// Bu sayede bunları kullanacak insanlar kafasına göre metodlara erişemesin ya da yapabileceği görevleri bilsin bunlara göre işlerini yapsın
abstract class IPostService {
  Future<List<PostModel>?> fetchPostItemsAdvance();
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> updatetItemToService(PostModel postModel, int id);
  Future<bool> deleteItemFromService(int id);
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));

  // Veri çekme
  @override
  Future<List<PostModel>?> fetchPostItemsAdvance() async {
    try {
      final response = await _dio.get(_PostServicePaths.posts.name);

      // İlk olarak bu işlem başarılı mı?
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => PostModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (e) {
      _ShowDebug.showDioError(e,this);
    }
    return null;
  }

  // Veri ekleme
  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePaths.posts.name, data: postModel);

      return response.statusCode == HttpStatus.created;
    } on DioException catch (e) {
      _ShowDebug.showDioError(e,this);
      return false;
    }
  }

  // Veri Güncelleme
  @override
  Future<bool> updatetItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePaths.posts.name}/${id.toString()}', data: postModel);

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (e) {
      _ShowDebug.showDioError(e,this);
      return false;
    }
  }

  // Veri silme
  @override
  Future<bool> deleteItemFromService(int id) async {
    try {
      // Direkt olarak postun idsine gideriz, data almayız
      final response = await _dio.delete('${_PostServicePaths.posts.name}/${id.toString()}');

      return response.statusCode == HttpStatus.ok;
    } on DioException catch (e) {
      _ShowDebug.showDioError(e,this);
      return false;
    }
  }

  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
      final response =
          await _dio.get('${_PostServicePaths.comments.name}', queryParameters: {_PostQueryPaths.postId.name: postId});

      // İlk olarak bu işlem başarılı mı?
      if (response.statusCode == HttpStatus.ok) {
        final _datas = response.data;

        if (_datas is List) {
          return _datas.map((e) => CommentModel.fromJson(e)).toList();
        }
      }
    } on DioException catch (e) {
      _ShowDebug.showDioError(e,this);
    }
    return null;
  }
}

enum _PostServicePaths { posts, comments }

enum _PostQueryPaths { postId }

class _ShowDebug {
  static void showDioError<T>(DioException exception,T type) {
    print(" HATA: ${exception.toString()}");
    print("Hata burada: $type");
    print("-------");
  }
}
