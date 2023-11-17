import 'package:flutter/material.dart';

Widget buildBackButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.arrow_back),
    splashRadius: 20.0,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}
