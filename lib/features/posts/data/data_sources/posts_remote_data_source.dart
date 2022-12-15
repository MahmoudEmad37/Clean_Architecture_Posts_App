import 'dart:convert';

import 'package:clean_architecture_posts_app/core/api/end_points.dart';
import 'package:clean_architecture_posts_app/core/api/status_code.dart';
import 'package:clean_architecture_posts_app/core/error/exception.dart';
import 'package:clean_architecture_posts_app/features/posts/data/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();

  Future<Unit> deletePost(int postId);

  Future<Unit> updatePost(PostModel postModel);

  Future<Unit> addPost(PostModel postModel);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client;

  const PostRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse(API.GET_POSTS),
      headers: {API.CONTENT_HEADER: API.CONTENT_TYPE},
    );
    if (response.statusCode == StatusCode.ok) {
      final List decodedJson = json.decode(response.body) as List;
      final List<PostModel> postModels = decodedJson
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return postModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final response = await client.post(Uri.parse(API.GET_POSTS), body: body);
    if (response.statusCode == StatusCode.postOk) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse('${API.GET_POSTS}${postId.toString()}'),
      headers: {API.CONTENT_HEADER: API.CONTENT_TYPE},
    );
    if (response.statusCode == StatusCode.ok) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final response =
        await client.patch(Uri.parse('${API.GET_POSTS}$postId'), body: body);
    if (response.statusCode == StatusCode.ok) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
