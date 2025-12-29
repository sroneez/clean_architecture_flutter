import 'package:clean_architecture_flutter/features/posts/data/models/post_model.dart';
import 'package:clean_architecture_flutter/features/posts/domain/entities/post_entity.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repositories/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository postRepository;

  PostController({required this.postRepository});

  final RxList<PostEntity> posts = <PostEntity>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      final fetchedPosts = await postRepository.getPosts();
      posts.assignAll(fetchedPosts);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch posts: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createPost(String title, String body) async {
    isLoading.value = true;
    try {
      final newPost = PostEntity(title: title, body: body);
      final createPost = await postRepository.createPost(newPost);
      posts.insert(0, createPost);
      Get.back();
      Get.snackbar('Success', 'Post created successfully');
    } catch (e) {
      Get.snackbar('Failed', 'Failed to create post: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deletePost(int id) async {
    final originalList = List<PostEntity>.from(posts); //backup
    posts.removeWhere((p) => p.id == id);
    try {
      await postRepository.deletePost(id);
      Get.snackbar('Success', 'Post deleted');
    } catch (e) {
      posts.assignAll(originalList);
      Get.snackbar('Failed', 'Failed to delete post');
    }
  }
}
