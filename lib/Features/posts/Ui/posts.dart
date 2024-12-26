import 'package:bloc_api_integration/Features/posts/bloc/post_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});


  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts Page'),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous,current)=> current is PostActionState,
        buildWhen: (previous,current)=> current is !PostActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case PostFetchingLoadingState:
              return Center(child: CircularProgressIndicator());
            case PostFetchingSuccessfulState:
              final successState = state as PostFetchingSuccessfulState;
              return Container(
                child: ListView.builder(itemCount: successState.posts.length ,
                    itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(successState.posts[index].id.toString()),
                        SizedBox(height: 10,),
                        Text(successState.posts[index].userId.toString()),
                        SizedBox(height: 10,),
                        Text(successState.posts[index].title),
                        SizedBox(height: 10,),
                        Text(successState.posts[index].body),
                        SizedBox(height: 10,),


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
