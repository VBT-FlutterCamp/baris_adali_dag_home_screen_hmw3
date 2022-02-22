import 'dart:convert';

List<IdModel> idModeleFromJson(String str) =>
    List<IdModel>.from(json.decode(str).map((x) => IdModel.fromJson(x)));

String idModelToJson(List<IdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IdModel {
  IdModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  int? userId;
  int? id;
  String? title;
  bool? completed;

  factory IdModel.fromJson(Map<String, dynamic> json) => IdModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}
