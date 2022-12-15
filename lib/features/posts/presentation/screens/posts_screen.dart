import 'package:clean_architecture_posts_app/core/widgets/loading_widget.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/screens/post_add_update_screen.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/widget/posts_screen/failure_posts_widget.dart';
import 'package:clean_architecture_posts_app/features/posts/presentation/widget/posts_screen/posts_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(context),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Posts'),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is SuccessPostsState) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              child: PostsListWidget(posts: state.posts),
            );
          } else if (state is FailurePostsState) {
            return FailurePostsWidget(
              message: state.message,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    const PostAddUpdateScreen(isUpdatePost: false)));
      },
      child: const Icon(Icons.add),
    );
  }
}
