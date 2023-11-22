import 'dart:ui';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haate_khori_app/screens/dashboard_screen.dart';

class SampleVideo extends StatefulWidget {
  const SampleVideo({super.key});

  @override
  State<SampleVideo> createState() => _SampleVideoState();
}

class _SampleVideoState extends State<SampleVideo> {

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(
      "assets/videos/thief0.mp4"
    );
    customVideoPlayerController = CustomVideoPlayerController(context: context, videoPlayerController: videoPlayerController);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    customVideoPlayerController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    List<String> videoFileLocation =[
      "assets/videos/thief0.mp4",
      "assets/videos/thief1.mp4",
    ];

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Video Player"),
      ),
      child: SafeArea(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: CustomVideoPlayer(
                  customVideoPlayerController: customVideoPlayerController
              ),
            ),
            ListView.builder(
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
                        onPressed: () async {
                         await _onTap(videoFileLocation, index);
                        },
                        child: Text("$index video",style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Acme",
                  fontFeatures: [FontFeature.tabularFigures()],
                        ),),
                      ),
                      ElevatedButton(
                          onPressed: ()async{
                            String positionTime = formattedTime(timeInSecond: videoPlayerController.value.position.inSeconds);
                            debugPrint(positionTime);
                            //debugPrint("${videoPlayerController.value.position.inSeconds}");
                          },
                          child: Text("Press Me")
                      ),

                      ElevatedButton(
                          onPressed: ()async{
                            await _onSpecificTap(videoFileLocation,index);
                            //debugPrint("${videoPlayerController.value.position.inSeconds}");
                          },
                          child: Text("Press Me")
                      ),
                    ],
                  );
                }
            ),
          ],
        ),
      ),
    );
  }

  _onTap(List<String> videoPlayerLocation, int index) {
    videoPlayerController.dispose();
    customVideoPlayerController.dispose();
    videoPlayerController =  VideoPlayerController.asset("${videoPlayerLocation[index]}")
      ..initialize().then((_){
        videoPlayerController.play();

        videoPlayerController.addListener(() {                       //custom Listner
          setState(() {
            if (!videoPlayerController.value.isPlaying && videoPlayerController.value.isInitialized &&
                (videoPlayerController.value.duration ==videoPlayerController.value.position)) {
              videoPlayerController.dispose();
              customVideoPlayerController.dispose();//checking the duration and position every time
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
            }
          });
        });
        setState(() {

        });
      });
    customVideoPlayerController = CustomVideoPlayerController(
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        durationPlayedTextStyle: TextStyle(
          fontSize: 14,
          color: Colors.white
        ),
        customVideoPlayerProgressBarSettings: CustomVideoPlayerProgressBarSettings(
          allowScrubbing: true,
        ),
      ),
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  _onSpecificTap(List<String> videoPlayerLocation, int index) {
    index = 0;
    videoPlayerController.dispose();
    customVideoPlayerController.dispose();
    videoPlayerController =  VideoPlayerController.asset("${videoPlayerLocation[0]}")
      ..initialize().then((_){

        videoPlayerController.addListener(() {                       //custom Listner
          setState(() {
            if (!videoPlayerController.value.isPlaying && videoPlayerController.value.isInitialized &&
                (videoPlayerController.value.duration ==videoPlayerController.value.position)) {
              videoPlayerController.dispose();
              customVideoPlayerController.dispose();//checking the duration and position every time
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
            }
          });
        });
        setState(() {
          videoPlayerController.seekTo(Duration(seconds: 10));
          videoPlayerController.play();
        });
      });
    customVideoPlayerController = CustomVideoPlayerController(
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        durationPlayedTextStyle: TextStyle(
            fontSize: 14,
            color: Colors.white
        ),
        customVideoPlayerProgressBarSettings: CustomVideoPlayerProgressBarSettings(
          allowScrubbing: true,
        ),
      ),
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  formattedTime({required int timeInSecond}) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }


}

