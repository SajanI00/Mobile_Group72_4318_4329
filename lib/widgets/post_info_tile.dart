import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/features/posts/providers/get_post_info_by_id_provider.dart';
import 'package:pet_adoption_app/widgets/loader.dart';
import 'package:intl/intl.dart';

class PostInfoTile extends ConsumerWidget {
  const PostInfoTile({
    Key? key,
    required this.date,
    required this.username,
  }) : super(key: key);

  final DateTime date;
  final String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postInfo = ref.watch(getPostInfoByIdProvider(username));
    return postInfo.when(
      data: (posts) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    posts.username,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd').format(posts.date),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }
}


// import 'package:pet_adoption_app/features/posts/models/post.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pet_adoption_app/features/posts/providers/get_post_info_by_id_provider.dart';
// import 'package:pet_adoption_app/widgets/loader.dart';
// import 'package:intl/intl.dart';

// class PostInfoTile extends ConsumerWidget {
//   const PostInfoTile({
//     Key? key,
//     required this.date,
//     required this.username,
//     required this.contactNumber,
//     required this.location,
//     required this.description,
//   }) : super(key: key);

//   final DateTime date;
//   final String username;
//   final String contactNumber;
//   final String location;
//   final String description;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return FutureBuilder(
//       future: ref.read(getPostInfoByIdProvider(username).future),
//       builder: (context, AsyncSnapshot<Post> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Loader();
//         } else if (snapshot.hasError) {
//           return Text(snapshot.error.toString());
//         } else {
//           final post = snapshot.data!;
//           return Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15,
//               vertical: 8,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(width: 10),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       post.username,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       DateFormat('yyyy-MM-dd').format(post.date),
//                       style: const TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Text(
//                       post.contactNumber,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       post.location,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Text(
//                       post.description,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Spacer(),
//                 const Icon(Icons.more_horiz),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }

