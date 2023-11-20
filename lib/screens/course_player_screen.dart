// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class CoursePlayerScreen extends StatefulWidget {
//   const CoursePlayerScreen({super.key});
//
//   @override
//   State<CoursePlayerScreen> createState() => _CoursePlayerScreenState();
// }
//
// class _CoursePlayerScreenState extends State<CoursePlayerScreen> {
//
//   FlickManager? flickManager;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             flex:1,
//             child: AspectRatio(
//                 aspectRatio: 16 / 10,
//               child: FlickVideoPlayer(
//                 flickManager: FlickManager(
//                   videoPlayerController:
//                   VideoPlayerController.asset("assets/videos/thief.mp4"),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(child: Text("Modules"))
//         ],
//       )
//     );
//   }
// }
