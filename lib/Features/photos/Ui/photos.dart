import 'package:bloc_api_integration/Features/photos/bloc/photos_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  final PhotosBloc photosBloc = PhotosBloc();
  @override
  void initState() {
    photosBloc.add(PhotoInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos Page'),
      ),
      body: BlocConsumer<PhotosBloc, PhotosState>(
        bloc: photosBloc,
        listenWhen: (previous,current)=> current is PhotosActionState,
        buildWhen: (previous,current)=> current is !PhotosActionState,
        listener: (context, state) {

        },
        builder: (context, state) {
          switch (state.runtimeType){
            case PhotosFetchingLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case PhotosFetchingSuccessState:
              final successState = state as PhotosFetchingSuccessState;
              return Container(
                child: ListView.builder(itemCount: successState.photos.length,
                    itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(successState.photos[index].id.toString()),
                        SizedBox(height: 10,),
                        Text(successState.photos[index].albumId.toString()),
                        SizedBox(height: 10,),
                        Text(successState.photos[index].title.toString()),
                        SizedBox(height: 10,),
                        Image(image: NetworkImage(successState.photos[index].thumbnailUrl.toString())),
                        SizedBox(height: 10,),
                        Image(image: NetworkImage(successState.photos[index].url.toString())),
                      ],
                    ),
                  );
                    }),

              );
            default:
              return SizedBox();
          }

        },
      ),
    );
  }
}
