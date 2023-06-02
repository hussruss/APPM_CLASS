import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images '),
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          return _buildImagesNetwork(
            context,
            'https://source.unsplash.com/random/250×250/?cats&${index}',
          );
        },
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
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text('Image not found'),
              );
            },
          ),
        ),
        Divider(),
      ],
    );
  }

  Image _buildImagesNetwork(BuildContext context, String imageAsset) {
    return Image.network(
      imageAsset,
      errorBuilder: (context, error, stackTrace) {
        return const Center(
          child: Text('Image not found'),
        );
      },
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        return loadingProgress != null
            ? const Center(child: CircularProgressIndicator())
            : child;
      },
    );
  }
}


  // Center(
  //         child: Container(
  //           height: 400,
  //           width: 400,
  //           color: Colors.red,
  //           child: Image(
  //               fit: BoxFit.fitWidth,
  //               image: AssetImage('assets/images/ls2.jpg')),
  //         ),
  //       )