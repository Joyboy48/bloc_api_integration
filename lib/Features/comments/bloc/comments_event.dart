part of 'comments_bloc.dart';

@immutable
sealed class CommentsEvent {}

class CommentsInitialFetchEvent extends CommentsEvent{}