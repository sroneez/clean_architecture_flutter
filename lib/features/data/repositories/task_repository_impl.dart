import 'package:clean_architecture_flutter/features/data/models/task_model.dart';
import 'package:clean_architecture_flutter/features/domain/repositories/task_repository.dart';
import 'package:hive/hive.dart';

class TaskRepositoryImp implements TaskRepository {
  final Box<Task> _taskBox;

  TaskRepositoryImp(this._taskBox);


  @override
  Future<void> createTask(Task task) {
    return _taskBox.put(task.id, task);
  }

  @override
  Future<void> deleteTask(Task task) {
    return task.delete();
  }

  @override
  Future<List<Task>> getTasks() async{
    return _taskBox.values.toList();
  }

  @override
  Future<void> updateTask(Task task) {
    return task.save();
  }
}
