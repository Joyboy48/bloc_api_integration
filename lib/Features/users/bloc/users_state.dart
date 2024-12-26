part of 'users_bloc.dart';

@immutable
sealed class UsersState {}

final class UsersInitial extends UsersState {}

sealed class UsersActionState extends UsersState{}

class UsersFetchingLoadingState extends UsersState{}

class UsersFetchingSuccessState extends UsersState{
  final List<UsersDataUiModel> users;
  UsersFetchingSuccessState({required this.users});
}
