import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_api_integration/Features/photos/models/photos_model.dart';
import 'package:bloc_api_integration/Features/photos/repos/photo_repo.dart';
import 'package:meta/meta.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotoInitialFetchEvent>(photoInitialFetchEvent);
  }

  FutureOr<void> photoInitialFetchEvent(PhotoInitialFetchEvent event,
      Emitter<PhotosState> emit) async {
    emit(PhotosFetchingLoadingState());
    try{
      List<PhotosDataUiModel> photos = await PhotoRepo.fetchPhotos();
      emit(PhotosFetchingSuccessState(photos: photos));
    }catch(e){

    }
  }
}
