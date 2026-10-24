import 'package:flutter/material.dart';

import '../../../Features/home/presentation/managers/featured_books_cubit/featured_books_cubit.dart';

SnackBar build_error_widget(String errMessage) {
  return SnackBar(
    content: Text(
      errMessage,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    duration: const Duration(seconds: 3),
  );
}
