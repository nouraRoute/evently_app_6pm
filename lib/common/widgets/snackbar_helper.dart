import 'package:flutter/material.dart';

class SnackbarHelper {
  static showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green.withValues(alpha: .7),
        content: Row(
          spacing: 10,
          children: [
            Icon(
              Icons.check_circle_outline_outlined,
              size: 22,
              color: Colors.white,
            ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red.withValues(alpha: .7),
        content: Row(
          spacing: 10,
          children: [
            Icon(Icons.error_outline_outlined, size: 22, color: Colors.white),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
