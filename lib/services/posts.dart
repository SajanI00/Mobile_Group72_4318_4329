import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  Future savePost(text) async {
    await FirebaseFirestore.instance.collection("records").add({
      'username': text,
      'contactNumber': text,
      'location': text,
      'type': text,
      'date': DateTime,
      'description': text
    });
  }
}
