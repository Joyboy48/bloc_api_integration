import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/users_data_model.dart';
import '../repos/user_repo.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersInitial()) {
    on<UsersInitialFetchEvent>(usersInitialFetchEvent);
  }

  FutureOr<void> usersInitialFetchEvent(UsersInitialFetchEvent event,
      Emitter<UsersState> emit) async {
    emit(UsersFetchingLoadingState());
    try{
      List<UsersDataUiModel> users = await UsersRepo.fetchUsers();
      emit(UsersFetchingSuccessState(users: users));
    }catch(e){

    }
  }
}
