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

class AudioPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Audio Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AudioPlayerWidget('audio1.mp3'),
            AudioPlayerWidget('audio2.mp3'),
            AudioPlayerWidget('audio3.mp3'),
          ],
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final String audioPath;

  AudioPlayerWidget(this.audioPath);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

enum PlayerState { stopped, playing, paused }

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer = AudioPlayer();
  PlayerState audioPlayerState = PlayerState.stopped;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

   void play() async {
    await audioPlayer.play(AssetSource(widget.audioPath));
    setState(() {
      audioPlayerState = PlayerState.playing;
    });
  }

  void pause() {
    audioPlayer.pause();
    setState(() {
      audioPlayerState = PlayerState.paused;
    });
  }

  void stop() {
    audioPlayer.stop();
    setState(() {
      audioPlayerState = PlayerState.stopped;
    });
  }

  @override
 Widget build(BuildContext context) {
  return Column(
    children: [
      Text(
        'Audio ${widget.audioPath}',
        style: TextStyle(fontSize: 20),
      ),
      if (audioPlayerState == PlayerState.playing)
        IconButton(
          icon: Icon(Icons.pause),
          iconSize: 40,
          color: Colors.red,
          onPressed: pause,
        )
      else if (audioPlayerState == PlayerState.paused)
        IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 40,
          color: Colors.green,
          onPressed: play,
        )
      else
        IconButton(
          icon: Icon(Icons.play_arrow),
          iconSize: 40,
          color: Colors.green,
          onPressed: () {
            play();
            // Допустим, play() переводит audioPlayerState в значение PlayerState.playing
          },
        ),
      IconButton(
        icon: Icon(Icons.stop),
        iconSize: 40,
        color: Colors.blue,
        onPressed: stop,
      ),
    ],
  );
}


}
