
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Duration? _duration;
    Duration? _position;

    String convertTwo(int number){
      return number < 10 ? "0$number" : "$number";
    }


    final duration = _duration!.inSeconds??0;
    final head = _position!.inSeconds??0;
    final remainded = max(0, duration- head);
    final mins = convertTwo(remainded ~/ 60.0);
    final secs = convertTwo(remainded % 60);



    List<String> videoFileLocation =[
      "assets/videos/thief0.mp4",
      "assets/videos/thief1.mp4",
    ];


    @override
    void dispose() {
      super.dispose();
      //_controller.dispose();
    }

    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16/9,
                child: _controller!=null && _controller!.value.isInitialized ?
                VideoPlayer(_controller!)
                  : Text("is Nothing happening"),
              ),
              _playView(context),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: videoFileLocation.length,
                    itemBuilder: (context,index){
                    return Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: (){
                            _onTap(videoFileLocation, index);
                          },
                          child: Text("$index video",style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Acme"
                          ),),
                        ),
                      ],
                    );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onTap(List<String> videoPlayerLocation, int index){
    final controller = VideoPlayerController.asset("${videoPlayerLocation[index]}");
    _controller = controller;
    controller.initialize().then((_){
      controller.play();
      setState(() {

      });
    });
  }


  _playView(BuildContext context)async{
    Duration? _duration;
    Duration? _position;
    var _progress = 0.0;
    if(_duration == null){
      _duration = _controller!.value.duration;
    }
    var position = await _controller!.position;
    _position = position;
    final playing = _controller!.value.isPlaying;
    if(playing){
      setState(() {
        _progress = _position!.inMilliseconds.ceilToDouble() / _duration!.inMilliseconds.ceilToDouble();
      });
    }

  }
}