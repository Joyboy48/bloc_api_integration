import 'package:bloc_api_integration/Features/comments/bloc/comments_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  final CommentsBloc commentsBloc = CommentsBloc();
  @override
  void initState() {
    commentsBloc.add(CommentsInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments page'),
      ),
      body: BlocConsumer<CommentsBloc, CommentsState>(
        bloc: commentsBloc,
        listenWhen: (previous,current)=> current is CommentsActionState,
        buildWhen: (previous,current)=> current is !CommentsActionState,
        listener: (context, state) {

        },
        builder: (context, state) {
          switch (state.runtimeType){
            case CommentsFetchingLoadingState:
              return Center(
                child: CircularProgressIndicator(),
              );
            case CommentsFetchingSuccessState:
              final successState = state as CommentsFetchingSuccessState;
              return Container(
                child: ListView.builder(itemCount: successState.comments.length,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        color: Colors.grey.shade200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(successState.comments[index].id.toString()),
                            SizedBox(height: 10,),
                            Text(successState.comments[index].postId.toString()),
                            SizedBox(height: 10,),
                            Text(successState.comments[index].name.toString()),
                            SizedBox(height: 10,),
                            Text(successState.comments[index].email.toString()),
                            SizedBox(height: 10,),
                            Text(successState.comments[index].body.toString()),
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
