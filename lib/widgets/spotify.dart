import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Spotify extends StatefulWidget {
  const Spotify({super.key});

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  AudioPlayer audioPlayer = AudioPlayer();
  Duration? max = Duration();
  Duration currentDuration = Duration();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildAlbum(),
            _buildControllers(),
          ],
        ),
      ),
    );
  }

  void _play() async {
    if (audioPlayer.state == PlayerState.playing) {
      await audioPlayer.pause();
    } else {
      await audioPlayer.play(AssetSource('audio/futuristic-beat-146661.mp3'));
    }
    max = await audioPlayer.getDuration();
    audioPlayer.onPositionChanged.listen((event) {
      currentDuration = event;
      setState(() {});
    });
    setState(() {});
  }

  Expanded _buildControllers() {
    return Expanded(
        child: Column(
      children: [
        Slider(
            value: currentDuration.inMilliseconds.toDouble(),
            max: max!.inMilliseconds.toDouble(),
            onChanged: (i) {
              audioPlayer.seek(Duration(milliseconds: i.toInt()));
            }),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Colors.white,
            ),
            GestureDetector(
              onTap: () {
                _play();
              },
              child: Icon(
                audioPlayer.state == PlayerState.playing
                    ? Icons.pause_circle_filled
                    : Icons.play_circle_fill,
                size: 80,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: Colors.white,
            ),
          ],
        )
      ],
    ));
  }

  Expanded _buildAlbum() =>
      Expanded(flex: 2, child: Image.asset('assets/images/album.jpg'));

  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.arrow_circle_down_sharp,
            size: 30,
            color: Colors.white,
          ),
          Text(
            'Spotify',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Icon(
            Icons.more_vert_rounded,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
