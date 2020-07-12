
import 'package:equatable/equatable.dart';

class Article extends Equatable{
  final int id;
  final String link;
  final String title;
  final String content;
  final String excerpt;
  final String imageUrl;
  final String date;

  Article({this.id, this.link, this.title, this.content, this.excerpt,
      this.imageUrl, this.date});

  @override
  List<Object> get props => [id, title, content,excerpt,link,imageUrl,date ];

  @override
  String toString() => 'Post { id: $id }';

  factory Article.fromJson(Map<String,dynamic> json){
    return Article(
      id: json['id'],
      link: json['link'],
      title: json['title']['rendered'],
      content: json['content']['rendered'],
      //excerpt: json['excerpt']['rendered'],
      imageUrl: json['jetpack_featured_media_url'],
      date: json['date']
    );
  }
}