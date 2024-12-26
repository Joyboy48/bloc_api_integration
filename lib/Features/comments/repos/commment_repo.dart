import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api_integration/Features/comments/models/comments_model.dart';
import 'package:bloc_api_integration/Features/photos/models/photos_model.dart';
import 'package:http/http.dart' as http;

class CommmentRepo {
  static Future<List<CommentsDataUiModel>> fetchComments() async {
    var client = http.Client();
    List<CommentsDataUiModel> comments = [];
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      List result = jsonDecode(response.body);
      for(int i=0;i<result.length;i++){
        CommentsDataUiModel comment = CommentsDataUiModel.fromJson(result[i] as Map<String,dynamic>);
        comments.add(comment);
      }
      return comments;
    }catch(e){
      log(e.toString());
      return [];
    }
  }
}
