import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/user_form/bloc/user_form_bloc.dart';
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
            builder: (BuildContext context, UserListState state) {
          final bloc = context.read<UserListBloc>();
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
                  );
                });
          }

          return const SizedBox();
        }),
      ),
    );
  }
}
