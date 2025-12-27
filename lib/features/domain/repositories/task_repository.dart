import 'package:clean_architecture_flutter/features/data/models/task_model.dart';

abstract class TaskRepository{
  Future<List<Task>> getTasks();
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(Task task);
}