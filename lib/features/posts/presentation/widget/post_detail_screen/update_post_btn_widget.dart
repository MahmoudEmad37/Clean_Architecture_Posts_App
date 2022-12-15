import 'package:clean_architecture_posts_app/features/posts/presentation/screens/post_add_update_screen.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/post.dart';

class UpdatePostBtnWidget extends StatelessWidget {
  final Post post;

  const UpdatePostBtnWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      PostAddUpdateScreen(isUpdatePost: true, post: post)));
        },
        icon: const Icon(Icons.edit),
        label: const Text("Edit"));
  }
}
