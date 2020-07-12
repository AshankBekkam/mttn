import 'package:equatable/equatable.dart';
import 'package:mttn/models/article.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostFailure extends PostState {}

class PostSuccess extends PostState {
  final List<Article> posts;
  final bool hasReachedMax;
  final int pageNo;

  const PostSuccess({this.posts, this.hasReachedMax, this.pageNo});

  PostSuccess copyWith({
    List<Article> posts,
    bool hasReachedMax,
    int pageNo,
  }) {
    return PostSuccess(
        posts: posts ?? this.posts,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        pageNo: pageNo ?? this.pageNo);
  }

  @override
  List<Object> get props => [posts, hasReachedMax,pageNo];

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, hasReachedMax: $hasReachedMax,pageNo: $pageNo }';
}
