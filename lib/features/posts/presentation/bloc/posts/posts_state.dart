part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState{}

class SuccessPostsState extends PostsState{
  final List<Post> posts;

  const SuccessPostsState({required this.posts});

  @override
  List<Object>get props => [posts];

}

class FailurePostsState extends PostsState{
  final String message;

  const FailurePostsState({required this.message});

  @override
  List<Object>get props => [message];

}



