import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/core/usecases/usecase.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUsecase implements UseCase<Unit,Post>{
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);

  @override
  Future<Either<Failure, Unit>>call(Post post) async{
    return await repository.updatePost(post);
  }
}