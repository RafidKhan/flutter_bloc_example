import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_example/models/user_model.dart';
import 'package:flutter_bloc_example/user_list/bloc/user_list_state.dart';

class UserListBloc extends BlocBase<UserListState> {
  UserListBloc()
      : super(const UserListState(
          isLoading: false,
          hasError: false,
          users: [],
        )) {
    fetchUsers();
  }

  Future fetchUsers() async {
    try {
      emit(state.copyWith(
        isLoading: true,
      ));
      final Dio dio = Dio();
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/users");
      List users = response.data;
      List<UserModel> tempUsers = [];
      users.forEach((element) {
        tempUsers
            .add(UserModel(name: element['name'], email: element['email']));
      });
      emit(state.copyWith(
        isLoading: false,
        users: tempUsers,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
