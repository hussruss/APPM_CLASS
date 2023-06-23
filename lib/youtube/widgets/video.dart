import 'package:flutter/material.dart';
import 'package:m1_s4/youtube/models/video.dart';

class VideoWidget extends StatelessWidget {
  final Video video;
  const VideoWidget({required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      // width: MediaQuery.of(context).size.width,
      child: Column(children: [
        Image.network(
          video.thumbnail,
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
        SizedBox(height: 10),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(video.chanelUrl),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  video.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${video.chanel} - ${video.views} k vistas - hace ${DateTime.now().difference(video.date).inDays} día',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                )
              ],
            )),
            Icon(Icons.more_vert_outlined)
          ],
        )
      ]),
    );
  }
}
