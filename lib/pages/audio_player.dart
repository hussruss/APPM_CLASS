import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerPage extends StatefulWidget {
  const AudioPlayerPage({super.key});

  @override
  State<AudioPlayerPage> createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  List<Map<String, dynamic>> songs = [
    {
      'title': 'Song 1',
      'artist': 'Artist 1',
      'audioUrl': 'audio/futuristic-beat-146661.mp3'
    },
    {
      'title': 'Song 2',
      'artist': 'Artist 2',
      'audioUrl': 'audio/futuristic-beat-146661.mp3'
    },
  ];

  final AudioPlayer audioPlayer = AudioPlayer();

  void playSong(String audioUrl) async {
    await audioPlayer.stop();
    await audioPlayer.play(AssetSource(audioUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            title: Text(song['title']),
            subtitle: Text(song['artist']),
            leading: Icon(Icons.music_note),
            trailing: GestureDetector(
              onTap: () {
                playSong(song['audioUrl']);
              },
              child: Icon(Icons.play_arrow),
            ),
          );
        },
      ),
    );
  }
}
