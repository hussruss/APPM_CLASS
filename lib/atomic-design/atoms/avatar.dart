import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String imageUrl;
  const Avatar({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
