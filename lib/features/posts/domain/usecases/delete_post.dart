import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/core/usecases/usecase.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class DeletePostUsecase implements UseCase<Unit,int>{
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  @override
  Future<Either<Failure, Unit>>call(int postId) async{
    return await repository.deletePost(postId);
  }
}