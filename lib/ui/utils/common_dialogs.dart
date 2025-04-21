import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showCloseAppDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Are you sure you want to close the app?"),
        actions: [
          TextButton(
            onPressed: () =>Navigator.of(context).pop(),
            child: const Text("CANCEL"),
          ),
          TextButton(
            onPressed: () =>SystemNavigator.pop(),
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
