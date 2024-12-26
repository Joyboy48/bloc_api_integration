import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api_integration/Features/comments/models/comments_model.dart';
import 'package:bloc_api_integration/Features/photos/models/photos_model.dart';
import 'package:http/http.dart' as http;

import '../models/users_data_model.dart';

class UsersRepo {
  static Future<List<UsersDataUiModel>> fetchUsers() async {
    var client = http.Client();
    List<UsersDataUiModel> users = [];
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/users'));
      List result = jsonDecode(response.body);
      for(int i=0;i<result.length;i++){
        UsersDataUiModel user = UsersDataUiModel.fromJson(result[i] as Map<String,dynamic>);
        users.add(user);
      }
      return users;
    }catch(e){
      log(e.toString());
      return [];
    }
  }
}
