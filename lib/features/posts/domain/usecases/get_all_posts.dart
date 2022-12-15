import 'package:clean_architecture_posts_app/core/usecases/usecase.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

class GetAllPostsUsecase implements UseCase<List<Post>,NoParams>{
  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) async{
    return await repository.getAllPosts();
  }

}