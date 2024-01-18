import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:pet_adoption_app/features/posts/models/post.dart';

@immutable
class PostRepository {
  final _firestore = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  //make post
  Future<String?> makePost({
    required String username,
    required String contactNumber,
    File? file,
    required String location,
    required String postType,
    required DateTime date,
    required String description,
  }) async {
    try {
      final postId = const Uuid().v1();
      final now = DateTime.now();

      const username = ' ';
      const contactNumber = ' ';
      const location = ' ';
      const postType = ' ';
      const description = ' ';

      String? downloadUrl;
      if (file != null) {
        final fileUid = const Uuid().v1();
        final path = _storage.ref('images').child(fileUid);
        final taskSnapshot = await path.putFile(file);
        downloadUrl = await taskSnapshot.ref.getDownloadURL();
      }

      Post post = Post(
          postId: postId,
          username: username,
          contactNumber: contactNumber,
          location: location,
          postType: postType,
          date: date,
          description: description,
          fileUrl: downloadUrl);

      _firestore.collection('posts').doc(postId).set(post.toMap());

      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
