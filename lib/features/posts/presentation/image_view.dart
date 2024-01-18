import 'dart:io';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView({
    Key? key,
    required this.file,
  }) : super(key: key);

  final File file;

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
            child: Image.network(
              file.path,
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
