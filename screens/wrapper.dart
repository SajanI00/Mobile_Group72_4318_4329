import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screens/main/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: '/', routes: {'/': (context) => Home()});
  }
}
