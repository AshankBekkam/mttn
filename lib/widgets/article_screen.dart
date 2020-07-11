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
          Heading(title: article.title),
        ];
      },
      body: Container(
        child:SingleChildScrollView(padding: EdgeInsets.all(10),
          child: Html(
            data: "<div>${article.content}</div>",
            style:{
              'div':Style(fontSize: FontSize.small,
                color: Colors.white)
            },
          ),
        ),
      ),
    ));
  }
}
