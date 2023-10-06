import 'package:custom_rating_bar_example/custom_rating_bar_example.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomRatingBar(
        value: 3.5,
      )),
    );
  }
}
