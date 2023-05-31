import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images '),
      ),
      body: ListView(
        children: [
          _buildImages(context, 'assets/images/ls1.jpeg'),
          _buildImages(context, 'assets/images/ls2.jpg'),
          _buildImages(context, 'assets/images/ls3.jpg'),
        ],
      ),
    );
  }

  Column _buildImages(BuildContext context, String imageAsset) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          color: Colors.red,
          child: Image(
            image: AssetImage(imageAsset),
            alignment: Alignment.topLeft,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Text('Image not found'),
              );
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
