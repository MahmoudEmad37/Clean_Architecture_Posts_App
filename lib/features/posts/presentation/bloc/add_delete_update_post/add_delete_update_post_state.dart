part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

class SuccessAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  const SuccessAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}

class FailureAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  const FailureAddDeleteUpdatePostState({required this.message});

  @override
  List<Object> get props => [message];
}