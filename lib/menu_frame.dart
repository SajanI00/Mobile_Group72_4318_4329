// import 'package:flutter/material.dart';
// import 'package:pet/adoption_screen.dart';
// import 'package:pet/menu_screen.dart';

// class MenuFrame extends StatefulWidget {
//   @override
//   State<MenuFrame> createState() => _MenuFrameState();
// }

// class _MenuFrameState extends State<MenuFrame>
//     with SingleTickerProviderStateMixin {
//   AnimationController _animationController;
//   Animation<double> scaleAnimation;
//   Duration duration = Duration(milliseconds: 200);

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _animationController = AnimationController(vsync: this, duration: duration);
//     scaleAnimation = Tween<double>(begin:1.0,end:0.6).animate(_animationController); 
//   }

//   Widget build(BuildContext context) {
//     final deviceWidth = MediaQuery.of(context).size.width;
//     return Stack(
//       children: <Widget>[
//         MenuScreen(),
//         AnimatedPositioned(
//             duration: duration,
//             top: 0,
//             bottom: 0,
//             left: deviceWidth * 0.55,
//             right: deviceWidth * -0.45,
//             child: ScaleTransition(
//               scale: scaleAnimation,
//               child: AdoptionScreen())),
//       ],
//     );
//   }
// }
