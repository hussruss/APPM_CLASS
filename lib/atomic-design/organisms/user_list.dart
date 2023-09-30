import 'package:flutter/material.dart';
import 'package:m1_s4/atomic-design/models/user.dart';
import 'package:m1_s4/atomic-design/molecules/user_card.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sampleUsers.length,
      itemBuilder: (context, index) {
        final User user = sampleUsers[index];
        return UserCard(user: user);
      },
    );
  }
}

List<User> sampleUsers = [
  User(
    imageUrl:
        'https://learnyzen.com/wp-content/uploads/2017/08/test1-481x385.png',
    name: 'John Doe',
    email: 'john.doe@example.com',
  ),
  User(
    imageUrl:
        'https://franchisematch.com/wp-content/uploads/2015/02/john-doe.jpg',
    name: 'Jane Smith',
    email: 'jane.smith@example.com',
  ),
  // Más usuarios ...
];
