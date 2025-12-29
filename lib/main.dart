import 'package:clean_architecture_flutter/features/posts/data/repositories/post_repository_impl.dart';
import 'package:clean_architecture_flutter/features/posts/domain/repositories/post_repository.dart';
import 'package:clean_architecture_flutter/features/posts/presentation/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/posts/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = PostRepositoryImpl();
  Get.put(PostController(postRepository: repository));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  HomePage(),
    );
  }
}
