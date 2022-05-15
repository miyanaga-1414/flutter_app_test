import 'package:flutter/material.dart';

class Util {
  static Future<void> utilShowDialog(BuildContext context, String message) async {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}