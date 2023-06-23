import 'package:flutter/material.dart';
import 'package:m1_s4/youtube/models/video.dart';

class ShortWidget extends StatelessWidget {
  final Short short;
  const ShortWidget({required this.short, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: 190,
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.hardEdge,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              short.thumbnail,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress != null
                    ? Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                      )
                    : child;
              },
            ),
          ),
          Positioned(
              bottom: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        short.title,
                      ),
                    ),
                    Container(
                      child: Text(
                        '${short.views} K vistas',
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
