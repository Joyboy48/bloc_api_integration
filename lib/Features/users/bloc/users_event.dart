part of 'users_bloc.dart';

@immutable
sealed class UsersEvent {}

class UsersInitialFetchEvent extends UsersEvent{}
