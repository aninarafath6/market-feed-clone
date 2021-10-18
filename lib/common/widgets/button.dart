import 'package:flutter/material.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.label,
    this.onTap,
  }) : super(key: key);
  final String? label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            label!,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}