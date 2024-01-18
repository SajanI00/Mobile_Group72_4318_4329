import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    double fixedWidth = 250.0;
    double fixedHeight = 250.0;

    return Center(
      child: SizedBox(
        width: fixedWidth,
        height: fixedHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              assetPath,
              errorBuilder: (context, error, stackTrace) {
                return const Text('Error loading image');
              },
            ),
          ),
        ),
      ),
    );
  }
}
