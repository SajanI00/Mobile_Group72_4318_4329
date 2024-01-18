import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/features/posts/models/post.dart';
import 'package:pet_adoption_app/features/posts/presentation/image_view.dart';
import 'package:pet_adoption_app/widgets/post_info_tile.dart';

class PostTile extends ConsumerWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          PostInfoTile(
            date: post.date,
            username: post.username,
          ),
          // Post Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Text(post.description),
          ),
          // Post Video / Image
          ImageView(
            file: post.file!,
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:pet_adoption_app/features/posts/models/post.dart';
// import 'package:pet_adoption_app/features/posts/presentation/post_image.dart';
// //import 'package:pet_adoption_app/widgets/post_info_tile.dart';

// class PostTile extends StatelessWidget {
//   const PostTile({Key? key, required this.postId}) : super(key: key);

//   final String postId;

//   @override
//   Widget build(BuildContext context) {
//     final List<Post> postsList = [
//       Post(
//         postId: '1',
//         username: 'John Doe',
//         contactNumber: '071 234 3456',
//         postType: 'lost',
//         location: '5th lane, karapitiya, Galle',
//         date: DateTime.now(),
//         description: 'Brown dog was lost',
//         assetPath: 'images/image1.png',
//       ),
//       Post(
//         postId: '2',
//         username: 'Jane Green',
//         contactNumber: '070 567 3498',
//         postType: 'found',
//         location: 'faculty hostel, engineering faculty, hapugala, galle',
//         date: DateTime.now(),
//         description: 'My cat Milo was lost. He is a grey and white male cat',
//         assetPath: 'images/image2.jpg',
//       ),
//     ];

//     final post = postsList.firstWhere(
//       (post) => post.postId == postId,
//       orElse: () => Post(
//         postId: '',
//         username: '',
//         contactNumber: '',
//         postType: '',
//         location: '',
//         date: DateTime.now(),
//         description: '',
//       ),
//     );

//     return Container(
//       // color: Colors.white,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: Colors.lightGreen, // You can define your border color
//           width: 2.0, // You can adjust the border width
//         ),
//         borderRadius:
//             BorderRadius.circular(10.0), // You can adjust the border radius
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Post Header

//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   DateFormat('yyyy-MM-dd').format(post.date),
//                   style: const TextStyle(
//                     fontSize: 14,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   post.username,
//                   style: const TextStyle(
//                       fontSize: 18,
//                       color: Colors.teal,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Contact Number: ${post.contactNumber}',
//                   style: const TextStyle(fontSize: 18, color: Color(0xff5885a9)),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   'Location: ${post.location}',
//                   style: const TextStyle(fontSize: 18, color: Colors.teal),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   post.description,
//                   style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
//                 ),
//               ],
//             ),
//           ),

//           PostImage(
//             assetPath: post.assetPath!,
//           ),
//           const SizedBox(height: 10),
//         ],
//       ),
//     );
//   }
// }
