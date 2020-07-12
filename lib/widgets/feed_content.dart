import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mttn/models/article.dart';
import 'package:mttn/widgets/big_post.dart';
import 'dart:convert';
import 'package:mttn/widgets/small_post.dart';
import 'package:google_fonts/google_fonts.dart';
import 'article_screen.dart';
import '../bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> with AutomaticKeepAliveClientMixin<FeedContent> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  PostBloc _postBloc;

  @override
  bool get wantKeepAlive=>true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _postBloc = BlocProvider.of<PostBloc>(context);
    //_postsFuture = _getPosts(pageNo);
    print('getting posts');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<PostBloc, PostState>(buildWhen:(previous, current) =>previous!=current,
      builder: (context, state) {
        if (state is PostFailure) {
          return Center(child: Text('Error'));
        }
        if (state is PostSuccess) {
          if (state.posts.isEmpty) {
            return Center(
              child: Text('no posts'),
            );
          }
          return ListView(
            controller: _scrollController,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * .35,
                margin: const EdgeInsets.symmetric(vertical: 15.0),
                child: PageView.builder(
                  controller: PageController(viewportFraction: .75),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, i) => OverlayedContainer(
                    /*onTap: () {
                    print("tapped");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticleScreen(
                              article: state.posts[i],
                            )));
                  },*/
                    image: "https://i.imgur.com/IN9iZCc.png",
                    title: "test_title",
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
                      itemCount: state.hasReachedMax
                          ? state.posts.length
                          : state.posts.length + 1,
                      itemBuilder: (context, index) {
                        return index >= state.posts.length
                            ? BottomLoader()
                            : PostContainer(onTap: () {
                          print("tapped");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleScreen(
                                    article: state.posts[index],
                                  )));
                        },
                                image: state.posts[index].imageUrl,
                                title: state.posts[index].title,
                              );
                      },
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
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _postBloc.add(PostFetched());
    }
  }
}

class BottomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

/*List<Article> parsePosts(response) {
  final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  return parsed.map<Article>((json) => Article.fromJson(json)).toList();
}

Future<List<Article>> _getPosts(int pageNo) async {
  final baseUrl = "http://manipalthetalk.org/wp-json/wp/v2/posts?page=$pageNo";
  final response = await http.get(baseUrl);
  return compute(parsePosts, response.body);
}
*/