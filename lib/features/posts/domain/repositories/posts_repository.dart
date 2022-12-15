import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();

  Future<Either<Failure, Unit>> addPost(Post post);

  Future<Either<Failure, Unit>> updatePost(Post post);

  Future<Either<Failure, Unit>> deletePost(int id);
}
