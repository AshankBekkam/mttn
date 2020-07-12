import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:mttn/models/article.dart';
import './bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

class PostBloc extends Bloc<PostEvent, PostState> {

  final http.Client httpClient;

  PostBloc({@required this.httpClient}) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await _fetchPosts(_getPageNo(currentState));
          yield PostSuccess(posts: posts, hasReachedMax: false,pageNo: 2);
          return;
        }
        if (currentState is PostSuccess) {
          final posts = await _fetchPosts(_getPageNo(currentState));
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
            posts: currentState.posts + posts,
            hasReachedMax: false,
            pageNo: currentState.pageNo+1
          );
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }
  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.hasReachedMax;
  
  int _getPageNo(PostState state){
    if(state is PostInitial)
      return 1;
    else if(state is PostSuccess){
      return state.pageNo;
    }
    else return 1;
  }

  Future<List<Article>> _fetchPosts(int pageNo) async {
    final response = await httpClient.get(
        'http://manipalthetalk.org/wp-json/wp/v2/posts?page=$pageNo');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Article(
          id: rawPost['id'],
          title: rawPost['title']['rendered'],
          imageUrl: rawPost['jetpack_featured_media_url'],
          date: rawPost['date'],
          content: rawPost['content']['rendered'],
          excerpt: rawPost['excerpt']['rendered'],
          link: rawPost['link']
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}


