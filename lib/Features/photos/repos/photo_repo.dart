import 'dart:convert';
import 'dart:developer';

import 'package:bloc_api_integration/Features/photos/models/photos_model.dart';
import 'package:http/http.dart' as http;

class PhotoRepo {
  static Future<List<PhotosDataUiModel>> fetchPhotos() async {
    var client = http.Client();
    List<PhotosDataUiModel> photos = [];
    try {
      var response = await client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      List result = jsonDecode(response.body);
      for(int i=0;i<result.length;i++){
        PhotosDataUiModel photo = PhotosDataUiModel.fromJson(result[i] as Map<String,dynamic>);
        photos.add(photo);
      }
      return photos;
    }catch(e){
      log(e.toString());
      return [];
          }
  }
}
