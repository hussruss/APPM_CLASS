import 'package:flutter/material.dart';
import 'package:m1_s4/atomic-design/atoms/avatar.dart';
import 'package:m1_s4/atomic-design/atoms/user_email.dart';
import 'package:m1_s4/atomic-design/atoms/user_name.dart';
import 'package:m1_s4/atomic-design/models/user.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Avatar(imageUrl: user.imageUrl),
        title: UserName(name: user.name),
        subtitle: UserEmail(email: user.email),
      ),
    );
  }
}
