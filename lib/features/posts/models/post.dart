import 'package:flutter/foundation.dart' show immutable;
import 'dart:io';

@immutable
class Post {
  final String postId;
  final String username;
  final String contactNumber;
  final String location;
  final String postType;
  final DateTime date;
  final String description;
  final File? file;
  final String? fileUrl;
  final String? assetPath;

  const Post(
      {required this.postId,
      required this.username,
      required this.contactNumber,
      required this.postType,
      required this.location,
      required this.date,
      required this.description,
      this.file,
      this.fileUrl,
      this.assetPath});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'username': username,
      'contactNumber': contactNumber,
      'postType': postType,
      'location': location,
      'fileUrl': fileUrl,
      'assetPath': assetPath,
      'file': file,
      'date': date.millisecondsSinceEpoch,
      'description': description,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'] ?? '',
      username: map['username'] ?? '',
      postType: map['postType'] ?? '',
      contactNumber: map['contactNumber'] ?? '',
      location: map['location'] ?? '',
      fileUrl: map['fileUrl'] ?? '',
      assetPath: map['assetPath'] ?? '',
      file: map['file'] != null ? File(map['file']) : null,
      date: DateTime.fromMillisecondsSinceEpoch(
        map['date'] ?? 0,
      ),
      description: map['description'] ?? '',
    );
  }
}
