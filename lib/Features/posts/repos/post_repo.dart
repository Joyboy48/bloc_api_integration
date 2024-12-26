import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api_integration/Features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;
class PostRepo{
  static Future<List<PostDataUiModel>> fetchPosts() async{
    var client = http.Client();
    List<PostDataUiModel> posts = [];
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      List result = jsonDecode(response.body);
      for(int i=0;i< result.length;i++){
        PostDataUiModel post = PostDataUiModel.fromJson(result[i] as Map<String,dynamic>);
        posts.add(post);
      }
      return posts;
  }catch(e){
      log(e.toString());
      return [];
    }}
}