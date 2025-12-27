import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../controllers/task_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Dependency Injection Setup
    // We find the box we opened in StorageService
    final taskBox = Hive.box<Task>('tasks');

    // We create the Repository
    final repository = TaskRepositoryImp(taskBox);

    // We put the Controller into memory, INJECTING the repository
    final controller = Get.put(TaskController(taskRepository: repository));

    return Scaffold(
      appBar: AppBar(title: const Text("Clean Architecture To-Do")),
      body: Obx(() {
        // TODO: Return a ListView.builder using controller.tasks
        // If controller.tasks.isEmpty, show a generic text message.
        if (controller.tasks.isEmpty) {
          return Center(child: Text('No tasks yet'));
        }
        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (context, index) {
            final data = controller.tasks[index];
            return ListTile(
              leading: Checkbox(
                value: data.isCompleted,
                onChanged: (val) {
                  controller.toggleTaskStatus(data);
                },
              ),
              trailing: TextButton.icon(
                onPressed: () {
                  controller.deleteTask(data);
                },
                label: Icon(
                  CupertinoIcons.delete,
                  color: CupertinoColors.destructiveRed,
                ),
              ),
              title: Text(data.text, style: TextStyle(fontSize: 18)),
              subtitle: Text(data.id, style: TextStyle(color: Colors.grey)),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>_showAddDialog(context, controller),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddDialog(BuildContext context, TaskController controller) {
    final textController = TextEditingController();
    Get.defaultDialog(
      title: "Add Task",
      content: TextField(controller: textController),
      onConfirm: () {
        if (textController.text.isNotEmpty) {
          controller.addTask(textController.text);
          Get.back();
        }
      },
    );
  }
}
