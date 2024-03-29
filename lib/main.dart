<<<<<<< HEAD
//Based on https://dartpad.dev/?id=d57c6c898dabb8c6fb41018588b8cf73
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';
import 'package:pet_adoption_app/screens/wrapper.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // The first step to using Firebase is to configure it so that our code can
  // find the Firebase project on the servers. This is not a security risk, as
  // explained here: https://stackoverflow.com/a/37484053
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // We sign the user in anonymously, meaning they get a user ID without having
  // to provide credentials. While this doesn't allow us to identify the user,
  // this would, for example, still allow us to associate data in the database
  // with each user.

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final DateFormat formatter = DateFormat('MM/dd HH:mm:SS');

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption app',
      home: Wrapper(),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet/adoption_screen.dart';
import 'package:pet/menu_frame.dart';
import 'package:pet/menu_screen.dart';

import 'animal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

Color mainColor = Color.fromRGBO(48, 96, 96, 1.0);
Color startingColor = Color.fromRGBO(70, 112, 112, 1.0);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      home: AdoptionScreen(),
    );
  }
}
>>>>>>> origin/main
