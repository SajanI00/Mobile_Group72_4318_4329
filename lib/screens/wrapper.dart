import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/main/home.dart';
import 'package:pet_adoption_app/screens/main/posts/add.dart';
import 'package:pet_adoption_app/features/posts/presentation/create_post_screen.dart';
import 'package:pet_adoption_app/screens/menu_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MenuScreen(),
          '/add': (context) => const Add(),
          '/createPost': (context) => const CreatePostScreen(),
          '/lost': (context) => const Home(),
        });
  }
}
