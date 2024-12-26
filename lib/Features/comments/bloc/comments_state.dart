part of 'comments_bloc.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

sealed class CommentsActionState extends CommentsState{}

class CommentsFetchingLoadingState extends CommentsState{}

class CommentsFetchingSuccessState extends CommentsState{
  final List<CommentsDataUiModel> comments;
  CommentsFetchingSuccessState({required this.comments});
}
