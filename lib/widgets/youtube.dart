import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class Youtube extends StatefulWidget {
  const Youtube({Key? key}) : super(key: key);

  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/utel.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [_buildVideo(), _buildRecomendations()],
        ),
      ),
    );
  }

  Expanded _buildRecomendations() {
    return Expanded(
        child: ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return _buildRecomendation(index);
      },
    ));
  }

  Padding _buildRecomendation(int idx) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            child: Image.network(
              'https://source.unsplash.com/random/1280x720/?videos&$idx',
              fit: BoxFit.cover,
            ),
          ),
          const Text(
            'Description',
            style: TextStyle(color: Colors.white),
          ),
          const Text(
            'Lorem ....',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  GestureDetector _buildVideo() {
    return GestureDetector(
      onTap: () {
        _controller.value.isPlaying ? _controller.pause() : _controller.play();
        setState(() {});
      },
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          children: [
            VideoPlayer(_controller),
            _controller.value.isPlaying
                ? Container()
                : Center(
                    child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 80,
                  ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
