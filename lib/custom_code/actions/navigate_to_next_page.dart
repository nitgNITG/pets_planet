// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> navigateToNextPage(BuildContext context) async {
  // Add any custom async logic (e.g., network call, animation, etc.)
  await Future.delayed(Duration(seconds: 1)); // Example delay

  // After async task is complete, navigate to the next page
  Navigator.pushReplacementNamed(
      context, '/loginPage'); // Replace '/nextPage' with your route name
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
