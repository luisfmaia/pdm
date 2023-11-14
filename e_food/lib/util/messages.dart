import 'package:e_food/theme/colors.dart';
import 'package:flutter/material.dart';

class Message {
  
  static void showMessage(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.primary,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.white, fontSize: 19),
        ),
      ),
    );
  }

  static void showError(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.secondary,
        content: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.red, fontSize: 19),
        ),
      ),
    );
  }
}
