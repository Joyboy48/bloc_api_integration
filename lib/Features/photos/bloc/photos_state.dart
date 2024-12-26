part of 'photos_bloc.dart';

@immutable
sealed class PhotosState {}

sealed class PhotosActionState extends PhotosState{}

final class PhotosInitial extends PhotosState {}

class PhotosFetchingLoadingState extends PhotosState{}

class PhotosFetchingSuccessState extends PhotosState{
  final List<PhotosDataUiModel> photos;
  PhotosFetchingSuccessState({required this.photos});
}
