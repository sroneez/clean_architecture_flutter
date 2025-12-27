import 'package:clean_architecture_flutter/features/data/models/task_model.dart';
import 'package:clean_architecture_flutter/features/domain/repositories/task_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final TaskRepository taskRepository;

  TaskController({required this.taskRepository});

  final RxList<Task> tasks = <Task>[].obs;

  Future<void> loadTask() async {
    try {
      var loadedTasks = await taskRepository.getTasks();
      tasks.assignAll(loadedTasks);
    } catch (e) {
      debugPrint('Error Loading task$e');
    }
  }

  Future<void> addTask(String title) async {
    try {
      Task newTask = Task(id: DateTime.now().toString(), text: title);

      await taskRepository.createTask(newTask);
      tasks.add(newTask);
    } catch (e) {
      debugPrint("Error adding task: $e");
    }
  }

  Future<void> toggleTaskStatus(Task task) async {
    task.isCompleted = !task.isCompleted;
    await taskRepository.updateTask(task);
    tasks.refresh();
  }

  Future<void> deleteTask(Task task) async {
    await taskRepository.deleteTask(task);
    tasks.remove(task);
  }
}
