import 'package:pet_adoption_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = AppColors.lightGreenColor,
    this.height = 50,
  });

  final VoidCallback? onPressed;
  final String label;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.darkGreenColor,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: (color == AppColors.lightGreenColor && onPressed != null)
                  ? AppColors.realWhiteColor
                  : AppColors.darkGreenColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
