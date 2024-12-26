import 'dart:convert';

List<PhotosDataUiModel> photosDataUiModelFromJson(String str) => List<PhotosDataUiModel>.from(json.decode(str).map((x) => PhotosDataUiModel.fromJson(x)));

String photosDataUiModelToJson(List<PhotosDataUiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotosDataUiModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotosDataUiModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotosDataUiModel.fromJson(Map<String, dynamic> json) => PhotosDataUiModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}