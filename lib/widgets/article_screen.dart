import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:mttn/widgets/heading.dart';
import '../models/article.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleScreen extends StatelessWidget {
  final Article article;

  ArticleScreen({@required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          Heading(

            image: article.imageUrl,
          ),
        ];
      },
      body: Container(
        /*decoration: BoxDecoration(color: Colors.black,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),*/
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Html(
            data: "${article.content}",
            style: {
              'html': Style(
                fontSize: FontSize.small,
                display: Display.INLINE,
                color: Colors.white,
              ),
              'p': Style(padding: EdgeInsets.only(right: 60))
            },
          ),
        ),
      ),
    ));
  }
}
