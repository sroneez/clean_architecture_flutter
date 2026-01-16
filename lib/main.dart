import 'package:clean_architecture_flutter/features/auth/domain/repository/auth_repository.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = AuthRepository();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(repository: repository)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
