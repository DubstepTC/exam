import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(AudioPlayerApp());
}

class AudioPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  playLocal(String audioPath) async {
    int result = await audioPlayer.play(audioPath, isLocal: true);
    if (result == 1) {
      // success
    }
  }

  pause() {
    audioPlayer.pause();
  }

  stop() {
    audioPlayer.stop();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => playLocal('assets/audio/audio1.mp3'),
              child: Text('Play Audio 1'),
            ),
            ElevatedButton(
              onPressed: () => playLocal('assets/audio/audio2.mp3'),
              child: Text('Play Audio 2'),
            ),
            ElevatedButton(
              onPressed: () => playLocal('assets/audio/audio3.mp3'),
              child: Text('Play Audio 3'),
            ),
            ElevatedButton(
              onPressed: pause,
              child: Text('Pause'),
            ),
            ElevatedButton(
              onPressed: stop,
              child: Text('Stop'),
            ),
          ],
        ),
      ),
    );
  }
}
