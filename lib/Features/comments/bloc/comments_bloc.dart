import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_integration/Features/comments/repos/commment_repo.dart';
import 'package:meta/meta.dart';

import '../../photos/bloc/photos_bloc.dart';
import '../../photos/repos/photo_repo.dart';
import '../models/comments_model.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc() : super(CommentsInitial()) {
    on<CommentsInitialFetchEvent>(commentsInitialFetchEvent);
  }

  FutureOr<void> commentsInitialFetchEvent(CommentsInitialFetchEvent event,
      Emitter<CommentsState> emit) async {
    emit(CommentsFetchingLoadingState());
    try{
      List<CommentsDataUiModel> comments = await CommmentRepo.fetchComments();
      emit(CommentsFetchingSuccessState(comments: comments));
    }catch(e){

    }
  }
}
