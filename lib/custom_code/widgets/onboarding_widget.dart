// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

class OnboardingWidget extends StatefulWidget {
  final List<dynamic> onboardingData;
  final double? width;
  final double? height;

  OnboardingWidget({required this.onboardingData, this.width, this.height});

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.onboardingData.length,
      onPageChanged: (index) {
        if (index == widget.onboardingData.length - 1) {
          // If user is on the last page, trigger a page change to the next page
          Future.delayed(Duration(milliseconds: 300), () {
            Navigator.pushReplacementNamed(context, '/LoginPage');
          });
        }
      },
      itemBuilder: (context, index) {
        final item = widget.onboardingData[index];
        final imageUrl = 'https://pets.nitg-eg.com${item['imageUrl']}';
        bool isLastPage = index == widget.onboardingData.length - 1;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl), // Adjust based on your JSON
            Text(item['title'], style: TextStyle(fontSize: 24)),
            if (isLastPage)
              ElevatedButton(
                onPressed: () {
                  // Navigate to the login page when the button is pressed
                  Navigator.pushReplacementNamed(context, '/LoginPage');
                },
                child: Text('Go to Login'),
              ),
            // Text(item['description'], style: TextStyle(fontSize: 16)),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
