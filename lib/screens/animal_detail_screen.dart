import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimalDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: <Widget>[
        Stack(
          children: <Widget>[ Container(height: screenHeight*0.5,
            color: Colors.yellow,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:<Widget>[
                    Icon(FontAwesomeIcons.arrowLeft,color: Theme.of(context).primaryColor,),
                    Icon(FontAwesomeIcons.share,color: Theme.of(context).primaryColor,),
                  ]),
                )
          ),
      ],),
      ]),
    );
  }
}