import 'package:flutter/material.dart';

extension ScaffoldMessengerExtension on BuildContext {
  void showSuccessMessage(String message) {
    final colorScheme = Theme.of(this).colorScheme;

    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: colorScheme.primary,
        ),
      );
  }

  void showErrorMessage(String message) {
    final colorScheme = Theme.of(this).colorScheme;

    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: colorScheme.error,
        ),
      );
  }
}