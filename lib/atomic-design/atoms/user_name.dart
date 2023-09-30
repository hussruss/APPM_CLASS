import 'package:flutter/material.dart';

class UserName extends StatelessWidget {
  final String name;
  const UserName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
