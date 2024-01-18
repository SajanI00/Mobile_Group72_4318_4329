import 'package:flutter/material.dart';
import 'package:pet_adoption_app/features/posts/presentation/make_post_widget.dart';
import 'package:pet_adoption_app/widgets/found_post_tile.dart';

class FoundPostsScreen extends StatelessWidget {
  const FoundPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          MakePostWidget(),
          FoundPostsList(),
        ],
      ),
    );
  }
}

class FoundPostsList extends StatelessWidget {
  const FoundPostsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> postIds = ['1', '2'];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final postId = postIds[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: FoundPostTile(postId: postId),
          );
        },
        childCount: postIds.length,
      ),
    );
  }
}
