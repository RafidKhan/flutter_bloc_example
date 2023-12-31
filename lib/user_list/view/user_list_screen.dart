import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/user_detail/view/user_detail_screen.dart';
import 'package:flutter_bloc_example/user_list/bloc/user_list_bloc.dart';
import 'package:flutter_bloc_example/user_list/bloc/user_list_state.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserListBloc(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UserListBloc, UserListState>(
            builder: (BuildContext context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.hasError) {
            return const Center(
              child: Text("Something Went Wrong"),
            );
          }

          if (state.users.isEmpty) {
            return const Center(
              child: Text("No Data Found"),
            );
          }

          if (state.users.isNotEmpty) {
            return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailScreen(
                            userModel: user,
                          ),
                        ),
                      );
                    },
                  );
                });
          }

          return const SizedBox();
        }),
      ),
    );
  }
}
