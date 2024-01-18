import 'package:flutter/material.dart';
import 'package:pet_adoption_app/features/posts/presentation/found_posts_screen.dart';
import 'package:pet_adoption_app/features/posts/presentation/posts_screen.dart';

class Constants {
  static const defaultPadding = EdgeInsets.symmetric(
    horizontal: 15,
    vertical: 10,
  );

  static const List<Widget> screens = [PostsScreen(), FoundPostsScreen()];

  Constants._();
}
