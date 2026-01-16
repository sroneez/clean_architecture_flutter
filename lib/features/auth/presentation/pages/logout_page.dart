import 'package:clean_architecture_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/bloc/auth_event.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/bloc/auth_state.dart';
import 'package:clean_architecture_flutter/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logout')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (_) => false,
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16,
              children: [
                Text('Email'),
                Text('Password'),
                SizedBox(height: 24),
                if (state is AuthLoading) ...[
                  CircularProgressIndicator(),
                ] else ...[
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(LogoutRequested());
                    },
                    child: Text('Logout'),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
