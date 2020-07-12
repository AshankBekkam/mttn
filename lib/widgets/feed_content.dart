import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mttn/models/article.dart';
import 'package:mttn/widgets/big_post.dart';
import 'dart:convert';
import 'package:mttn/widgets/small_post.dart';
import 'package:google_fonts/google_fonts.dart';
import 'article_screen.dart';

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  int pageNo = 1;
  Future<List<Article>> _postsFuture;
  @override
  void initState() {
    super.initState();
    _postsFuture = _getPosts(pageNo);
    print('getting posts');
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: FutureBuilder(
        future: _postsFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text(
                "ERROR",
                style: TextStyle(color: Colors.blue),
              ),
            );
          }
          if (snapshot.hasData) {
            return  ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .35,
                  margin: const EdgeInsets.symmetric(vertical: 15.0),
                  child: PageView.builder(
                    controller: PageController(viewportFraction: .75),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) => OverlayedContainer(
                      onTap: () {
                        print("tapped");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArticleScreen(
                                      article: snapshot.data[i],
                                    )));
                      },
                      image: "${snapshot.data[i].imageUrl}",
                      title: "${snapshot.data[i].title}",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text('All Posts',
                            style: GoogleFonts.robotoSlab(
                              fontSize: 30,
                              color: Colors.white,
                            )),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) => PostContainer(
                          image: snapshot.data[index].imageUrl,
                          title: snapshot.data[index].title,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

/*List<Article> parsePosts(response) {
  final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  print(parsed[2]['title']['rendered']);
  return parsed.map<Article>((json) => Article.fromJson(json)).toList();

}*/

List<Article> parsePosts(response) {
  final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}

Future<List<Article>> _getPosts(int pageNo) async {
  final baseUrl = "http://manipalthetalk.org/wp-json/wp/v2/posts?page=$pageNo";
  final response = await http.get(baseUrl);
  return compute(parsePosts, response.body);
}
