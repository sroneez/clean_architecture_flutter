import 'package:clean_architecture_flutter/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository{
  Future<List<PostEntity>> getPosts();
  Future<PostEntity> createPost(PostEntity post);
  Future<void> updatePost(PostEntity post);
  Future<void> deletePost(int id);
}