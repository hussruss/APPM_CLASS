import 'package:flutter/material.dart';
import 'package:m1_s4/atomic-design/organisms/user_list.dart';

class UsersAtomicDesign extends StatelessWidget {
  const UsersAtomicDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Atomic Design'),
      ),
      body: const UserList(),
    );
  }
}
