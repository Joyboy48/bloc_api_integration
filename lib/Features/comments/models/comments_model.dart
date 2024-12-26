import 'dart:convert';

List<CommentsDataUiModel> commentsDataUiModelFromJson(String str) => List<CommentsDataUiModel>.from(json.decode(str).map((x) => CommentsDataUiModel.fromJson(x)));

String commentsDataUiModelToJson(List<CommentsDataUiModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CommentsDataUiModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  CommentsDataUiModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentsDataUiModel.fromJson(Map<String, dynamic> json) => CommentsDataUiModel(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
