import 'dart:convert';

class NewsModel {
  NewsModel({
    required this.title,
    required this.description,
    required this.image,
    required this.author,
  });
  final String title;
  final String description;
  final String image;
  final String author;

  Map<String, dynamic> toMapBol() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'author': author,
    };
  }

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
        title: map['title'] as String,
        description: map['description'] as String,
        image: map['image'] as String,
        author: map['author'] as String);
  }
  String toJson() => json.encode(toMapBol());

  factory NewsModel.fromJson(String source) =>
      NewsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
