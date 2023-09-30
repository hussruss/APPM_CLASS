import 'package:flutter/material.dart';

class UserEmail extends StatelessWidget {
  final String email;
  const UserEmail({required this.email});

  @override
  Widget build(BuildContext context) {
    return Text(
      email,
      style: const TextStyle(fontSize: 14, color: Colors.grey),
    );
  }
}
