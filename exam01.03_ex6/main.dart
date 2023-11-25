//Когда вы добавите видеофайл с именем "sample_video.mp4" в папку assets, вы сможете запустить этот проект и увидеть воспроизведение видео с кнопками управления.
//
//
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/sample_video.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                if (isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                isPlaying = !isPlaying;
              });
            },
            child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          ),
          SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.pause();
                isPlaying = false;
              });
            },
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
