import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_integration/Features/posts/models/post_model.dart';
import 'package:bloc_api_integration/Features/posts/repos/post_repo.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
    
  }

  FutureOr<void> postInitialFetchEvent(PostInitialFetchEvent event,
      Emitter<PostState> emit) async {
    emit(PostFetchingLoadingState());
    try {
      List<PostDataUiModel> posts = await PostRepo.fetchPosts();
      emit(PostFetchingSuccessfulState(posts: posts));
    } catch (e) {
      emit(PostFetchingErrorState());
    }

  }
}
