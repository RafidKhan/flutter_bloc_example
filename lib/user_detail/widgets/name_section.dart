import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_bloc.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_state.dart';

class NameSection extends StatelessWidget {
  const NameSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (BuildContext context, state) {
      return Text(
        "Name: ${state.userModel?.name}",
        style: const TextStyle(fontSize: 18),
      );
    });
  }
}
