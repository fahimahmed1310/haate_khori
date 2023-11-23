import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haate_khori_app/providers/course_video_provider.dart';
import 'package:haate_khori_app/providers/dashboard_provider.dart';
import 'package:haate_khori_app/utils/constants/app_constants.dart';
import 'package:provider/provider.dart';

class CoursePlayerScreen extends StatefulWidget {
  const CoursePlayerScreen({super.key});

  @override
  State<CoursePlayerScreen> createState() => _CoursePlayerScreenState();
}

class _CoursePlayerScreenState extends State<CoursePlayerScreen> {

  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController customVideoPlayerController;
  bool isVideoOpened = false;





  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(
        "assets/videos/thief0.mp4"
    );
    customVideoPlayerController = CustomVideoPlayerController(context: context, videoPlayerController: videoPlayerController);

  }


  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardProvider>(builder: (_, dashBoardProvider, ___) {
      return Scaffold(
        body: SafeArea(
          child: Consumer<CourseVideoProvider>(
            builder: (_,courseVideoProvider,___){
              return courseVideoProvider.isFetchAllVideos == true ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.02,
                      top: MediaQuery.of(context).size.height * 0.01,
                      right: MediaQuery.of(context).size.width * 0.04,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: MediaQuery.of(context).size.width * 0.08,
                          color: Colors.white,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Expanded(
                          child: Text(
                            dashBoardProvider.fetchedCoursesList[dashBoardProvider.selectedMyCourseId].courseName,
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Acme",
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: isVideoOpened == true
                              ? CustomVideoPlayer(
                              customVideoPlayerController:
                              customVideoPlayerController)
                              : Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage(
                                    "${dashBoardProvider.fetchedCoursesList[dashBoardProvider.selectedMyCourseId].courseImage}"
                                ),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.circlePlay,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.02,
                                  ),
                                  const Expanded(
                                    child: Text(
                                      "Flutter: Thief Widget",
                                      style: TextStyle(
                                          fontFamily: "Acme",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Center(
                                    child: Text(
                                      "Bookmark Saved",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Acme",
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.green,
                                ));
                              },
                              child: const Icon(
                                Icons.bookmark,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Course Module :",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Acme",
                                  color: Colors.white),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  FontAwesomeIcons.circlePlay,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  courseVideoProvider.fetchedCourseVideoInfo.length.toString(),
                                  style: const TextStyle(
                                      fontFamily: "Acme",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.37,
                            child: ListView.separated(
                              itemCount:  courseVideoProvider.fetchedCourseVideoInfo.length,
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: ()async{
                                    await _onTap(index,courseVideoProvider);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        MediaQuery.of(context).size.height * 0.01),
                                    decoration: const BoxDecoration(
                                        color: AppConstants.secondaryColor),
                                    child:  Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${courseVideoProvider.fetchedCourseVideoInfo[index].courseVideoId}.",
                                              style: const TextStyle(
                                                  fontFamily: "Acme",
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.04 ,
                                            ),
                                            Text(
                                              "${courseVideoProvider.fetchedCourseVideoInfo[index].courseVideoName}",
                                              style: const TextStyle(
                                                  fontFamily: "Acme",
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context).size.width * 0.02 ,
                                            ),
                                            const Icon(
                                              FontAwesomeIcons.circlePlay,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        const Icon(FontAwesomeIcons.circleCheck,
                                            color: Colors.green)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
                  : const Center(
                child: CircularProgressIndicator(),
              );
            }
          ),
        ),
      );
    });
  }

  _onTap(int index, CourseVideoProvider courseVideoProvider) {
    videoPlayerController.dispose();
    customVideoPlayerController.dispose();
    videoPlayerController =  VideoPlayerController.asset("${courseVideoProvider.fetchedCourseVideoInfo[index].courseVideoLocation}")
      ..initialize().then((_){
        videoPlayerController.play();

        videoPlayerController.addListener(() {
          setState(() {
            isVideoOpened = true;
            if (!videoPlayerController.value.isPlaying && videoPlayerController.value.isInitialized &&
                (videoPlayerController.value.duration ==videoPlayerController.value.position)) {
              videoPlayerController.pause();
            }
          });
        });
      });
    customVideoPlayerController = CustomVideoPlayerController(
      customVideoPlayerSettings: const CustomVideoPlayerSettings(
        settingsButtonAvailable: false,
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

  // _onSpecificTap(List<String> videoPlayerLocation, int index) {
  //   index = 0;
  //   videoPlayerController.dispose();
  //   customVideoPlayerController.dispose();
  //   videoPlayerController =  VideoPlayerController.asset("${videoPlayerLocation[0]}")
  //     ..initialize().then((_){
  //
  //       videoPlayerController.addListener(() {                       //custom Listner
  //         setState(() {
  //           isVideoOpened = true;
  //           if (!videoPlayerController.value.isPlaying && videoPlayerController.value.isInitialized &&
  //               (videoPlayerController.value.duration ==videoPlayerController.value.position)) {
  //             videoPlayerController.dispose();
  //             customVideoPlayerController.dispose();//checking the duration and position every time
  //             //Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
  //           }
  //         });
  //       });
  //       setState(() {
  //         videoPlayerController.seekTo(Duration(seconds: 10));
  //         videoPlayerController.play();
  //       });
  //     });
  //   customVideoPlayerController = CustomVideoPlayerController(
  //     customVideoPlayerSettings: const CustomVideoPlayerSettings(
  //       durationPlayedTextStyle: TextStyle(
  //           fontSize: 14,
  //           color: Colors.white
  //       ),
  //       customVideoPlayerProgressBarSettings: CustomVideoPlayerProgressBarSettings(
  //         allowScrubbing: true,
  //       ),
  //     ),
  //     context: context,
  //     videoPlayerController: videoPlayerController,
  //   );
  // }


}
