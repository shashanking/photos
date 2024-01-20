// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotosDataModel {
  String? createdTime;
  String? id;
  final String description;
  final String altDescription;
  final String urlRegular;
  String? urlFull;
  String? thumbnailUrl;
  int? likes;
  String? authorName;
  String? authorPortfolioUrl;
  PhotosDataModel({
    this.createdTime,
    this.id,
    required this.description,
    required this.altDescription,
    required this.urlRegular,
    this.urlFull,
    this.thumbnailUrl,
    this.likes,
    this.authorName,
    this.authorPortfolioUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdTime': createdTime,
      'id': id,
      'description': description,
      'altDescription': altDescription,
      'urlRegular': urlRegular,
      'urlFull': urlFull,
      'thumbnailUrl': thumbnailUrl,
      'likes': likes,
      'authorName': authorName,
      'authorPortfolioUrl': authorPortfolioUrl,
    };
  }

  factory PhotosDataModel.fromMap(Map<dynamic, dynamic> map) {
    return PhotosDataModel(
      createdTime: map['created_at'] ?? "",
      id: map['id'] ?? "",
      description: map['description'] ?? "",
      altDescription: map['alt_description'] ?? "",
      urlRegular: map['urls']['regular'] ?? "",
      urlFull: map['urls']['full'] ?? "",
      thumbnailUrl: map['urls']['thumb'] ?? "",
      likes: map['likes'] ?? 0,
      authorName: map['user']['name'] ?? '',
      authorPortfolioUrl: map['user']['portfolio_url'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotosDataModel.fromJson(String source) =>
      PhotosDataModel.fromMap(json.decode(source) as Map<dynamic, dynamic>);
}



//  "albumId": 1,
//   "id": 1,
//   "title": "accusamus beatae ad facilis cum similique qui sunt",
//   "url": "https://via.placeholder.com/600/92c952",
//   "thumbnailUrl": "https://via.placeholder.com/150/92c952"
