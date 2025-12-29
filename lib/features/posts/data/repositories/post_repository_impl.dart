import 'dart:convert';

import 'package:clean_architecture_flutter/features/posts/data/models/post_model.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repositories/post_repository.dart';
import 'package:http/http.dart' as http;

class PostRepositoryImpl implements PostRepository {
  final String baseUrl = "https://jsonplaceholder.typicode.com/posts";

  @override
  Future<PostEntity> createPost(PostEntity post) async {
    final model = PostModel(title: post.title, body: post.body);
    final response = await http.post(
      Uri.parse(baseUrl),
      body: json.encode(model.toJson()),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 201) {
      return PostModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  @override
  Future<void> deletePost(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete post');
    }
  }

  @override
  Future<List<PostEntity>> getPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> body = json.decode(response.body);
      return body.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<void> updatePost(PostEntity post) async {
    final model = PostModel(title: post.title, body: post.body);
    final response = await http.post(
        Uri.parse('$baseUrl/${post.id}'), body: model, headers: {
      'Content-Type': 'application/json'
    });
    if (response.statusCode != 200) {
      throw Exception('Failed to update post');
    }
  }
}
