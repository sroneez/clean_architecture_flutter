import 'package:clean_architecture_flutter/features/profile/presentation/bloc/event/profile_event.dart';
import 'package:clean_architecture_flutter/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:clean_architecture_flutter/features/profile/presentation/bloc/state/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(LoadProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }if(state is ProfileLoaded){
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.email)));
          }
        },
        builder: (context, state) {
          // Handle Loading
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle Success
          if (state is ProfileLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.person, size: 100, color: Colors.blue),
                  Text(state.name, style: const TextStyle(fontSize: 24)),
                  Text(state.email, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            );
          }

          // Handle Error
          if (state is ProfileError) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: Text("Press button to load"));
        },
      ),
    );
  }
}
