import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc() : super(AlbumsInitial()) {
    on<AlbumsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
