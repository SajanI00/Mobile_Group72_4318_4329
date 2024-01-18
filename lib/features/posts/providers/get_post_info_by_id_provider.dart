import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/features/posts/models/post.dart';

final getPostInfoByIdProvider =
    FutureProvider.autoDispose.family<Post, String>((ref, username) {
  return FirebaseFirestore.instance
      .collection('posts')
      .doc(username)
      .get()
      .then((postData) {
    return Post.fromMap(postData.data()!);
  }
  );
}
);
// final getPostInfoByIdProvider =
//     FutureProvider.autoDispose.family<Post, String>((ref, postId) async {

//   final List<Post> postsList = [
//     Post(
//       postId: '1',
//       username: 'John Doe',
//       contactNumber: '1234567890',
//       postType: 'lost',
//       location: 'Some Location 1',
//       date: DateTime.now(),
//       description: 'Lost pet description 1',
//       file: File('images/image1.png'),
//     ),
//     Post(
//       postId: '2',
//       username: 'Jane Green',
//       contactNumber: '9876543210',
//       postType: 'found',
//       location: 'Some Location 2',
//       date: DateTime.now(),
//       description: 'Found pet description 2',
//       file: File('images/image2.jpg'),
//     ),

//   ];

//   final post = postsList.firstWhere((post) => post.postId == postId,
//       orElse: () => Post(
//             postId: '',
//             username: '',
//             contactNumber: '',
//             postType: '',
//             location: '',
//             date: DateTime.now(),
//             description: '',
//           ));

//   return post;
// });
