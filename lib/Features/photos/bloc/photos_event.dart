part of 'photos_bloc.dart';

@immutable
sealed class PhotosEvent {}

class PhotoInitialFetchEvent extends PhotosEvent{}
