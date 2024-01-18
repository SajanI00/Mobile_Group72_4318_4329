//import 'dart:ffi';
import 'package:flutter/cupertino.dart';

import 'package:pet_adoption_app/features/posts/presentation/create_post_screen.dart';
import 'package:pet_adoption_app/screens/main/error_screen.dart';
import 'package:pet_adoption_app/screens/main/home.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.routeName:
        return _cupertinoRoute(
          const Home(),
        );
      case CreatePostScreen.routeName:
        return _cupertinoRoute(
          const CreatePostScreen(),
        );

      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}
