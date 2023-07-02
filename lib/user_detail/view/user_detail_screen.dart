import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/models/user_model.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_bloc.dart';
import 'package:flutter_bloc_example/user_detail/bloc/user_detail_state.dart';
import 'package:flutter_bloc_example/user_detail/widgets/email_section.dart';
import 'package:flutter_bloc_example/user_detail/widgets/name_section.dart';
import 'package:flutter_bloc_example/user_detail/widgets/update_name_bottomsheet.dart';
import 'package:flutter_bloc_example/user_detail/widgets/user_name_section.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel userModel;

  const UserDetailScreen({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserDetailBloc(userModel: userModel),
      child: BlocBuilder<UserDetailBloc, UserDetailState>(
        builder: (BuildContext context, state) {
          final bloc = context.read<UserDetailBloc>();
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => UpdateNameBottomSheet(
                        nameController: state.nameController,
                        emailController: state.emailController,
                        userNameController: state.userNameController,
                        isEnabled: state.isSaveButtonEnabled,
                        onSave: () {
                          Navigator.pop(context);
                          bloc.updateData();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    NameSection(),
                    EmailSection(),
                    UserNameSection(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
