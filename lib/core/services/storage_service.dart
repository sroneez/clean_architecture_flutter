import 'package:clean_architecture_flutter/features/data/models/task_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>('tasks');

    return this;
  }
}
