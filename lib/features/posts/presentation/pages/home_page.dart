import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_controller.dart';

class HomePage extends StatelessWidget {
  final PostController controller = Get.find();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Global Posts 🌎")),

      body: Obx(() {
        if (controller.isLoading.value && controller.posts.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: CircleAvatar(child: Text(post.id.toString())),
                title: Text(
                  post.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  post.body,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => controller.deletePost(post.id!),
                ),
              ),
            );
          },
        );
      }),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddDialog(context),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    Get.defaultDialog(
      title: "New Post",
      content: Column(
        children: [
          TextField(controller: titleController, decoration: const InputDecoration(hintText: "Title")),
          const SizedBox(height: 10),
          TextField(controller: bodyController, decoration: const InputDecoration(hintText: "Body")),
        ],
      ),
      textConfirm: "Post",
      onConfirm: () {
        if (titleController.text.isNotEmpty) {
          controller.createPost(titleController.text, bodyController.text);
        }
      },
    );
  }
}