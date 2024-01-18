import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_adoption_app/features/posts/models/post.dart';
import 'package:pet_adoption_app/features/posts/presentation/post_image.dart';
//import 'package:pet_adoption_app/widgets/post_info_tile.dart';

class FoundPostTile extends StatelessWidget {
  const FoundPostTile({Key? key, required this.postId}) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    final List<Post> foundPostsList = [
      Post(
        postId: '1',
        username: 'Anne Black',
        contactNumber: '070 456 3498',
        postType: 'found',
        location: '345, Green street, Colombo7',
        date: DateTime.now(),
        description: 'Grey female cat was found in my garden',
        assetPath: 'images/image3.jpg',
      ),
      Post(
        postId: '2',
        username: 'John Snow',
        contactNumber: '071 439 5639',
        postType: 'found',
        location: '4th street, Hapugala, Galle',
        date: DateTime.now(),
        description: 'Is there an owner to this white fluffy cat',
        assetPath: 'images/image4.jpg',
      ),
    ];

    final post = foundPostsList.firstWhere(
      (post) => post.postId == postId,
      orElse: () => Post(
        postId: '',
        username: '',
        contactNumber: '',
        postType: '',
        location: '',
        date: DateTime.now(),
        description: '',
      ),
    );

    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightGreen,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').format(post.date),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  post.username,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Contact Number: ${post.contactNumber}',
                  style: const TextStyle(fontSize: 18, color: Color(0xff5885a9)),
                ),
                const SizedBox(height: 8),
                Text(
                  'Location: ${post.location}',
                  style: const TextStyle(fontSize: 18, color: Colors.teal),
                ),
                const SizedBox(height: 8),
                Text(
                  post.description,
                  style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
                ),
              ],
            ),
          ),

          PostImage(
            assetPath: post.assetPath!,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
