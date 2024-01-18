import 'package:flutter/material.dart';
import 'package:pet_adoption_app/core/screens/loader.dart';
import 'package:pet_adoption_app/features/posts/presentation/make_post_widget.dart';
import 'package:pet_adoption_app/features/posts/providers/get_all_posts_provider.dart';
import 'package:pet_adoption_app/screens/main/error_screen.dart';
import 'package:pet_adoption_app/widgets/post_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          MakePostWidget(),
          PostsList(),
        ],
      ),
    );
  }
}

class PostsList extends ConsumerWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(getAllPostsProvider);
    return posts.when(
      data: (postsList) {
        return SliverList.separated(
          itemCount: postsList.length,
          separatorBuilder: (context, Index) => const SizedBox(height: 8),
          itemBuilder: (context, Index) {
            final post = postsList.elementAt(Index);
            return PostTile(post: post);
          },
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: ErrorScreen(error: error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Loader(),
        );
      },
    );
  }
}

// class PostsList extends StatelessWidget {
//   const PostsList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<String> postIds = ['1', '2'];

//     return SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           final postId = postIds[index];
//           return Padding(
//             padding: const EdgeInsets.only(bottom: 8.0),
//             child: PostTile(postId: postId),
//           );
//         },
//         childCount: postIds.length,
//       ),
//     );
//   }
// }
