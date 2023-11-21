// import 'package:better_player/better_player.dart';
// import 'package:flutter/material.dart';
// import 'package:haate_khori_app/providers/dashboard_provider.dart';
// import 'package:provider/provider.dart';
//
// class CoursePlayerScreen extends StatefulWidget {
//   const CoursePlayerScreen({super.key});
//
//   @override
//   State<CoursePlayerScreen> createState() => _CoursePlayerScreenState();
// }
//
// class _CoursePlayerScreenState extends State<CoursePlayerScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<DashBoardProvider>(
//       builder: (_, dashBoardProvider, ___) {
//         return Scaffold(
//             body: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(
//                     left: MediaQuery.of(context).size.width * 0.02,
//                     top: MediaQuery.of(context).size.height * 0.01),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Icon(
//                       Icons.arrow_back,
//                       size: MediaQuery.of(context).size.width * 0.08,
//                       color: Colors.white,
//                     ),
//                     const Expanded(
//                       child: Text(
//                         "The Web Development Bootcamp",
//                         maxLines: 3,
//                         textAlign: TextAlign.center,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: "Acme",
//                           fontWeight: FontWeight.bold,
//                           fontSize: 28,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               BetterPlayer.file(
//                 "assets/videos/thief0.mp4",
//                 betterPlayerConfiguration: BetterPlayerConfiguration(
//                   aspectRatio: 16 / 9,
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.02,
//               ),
//               Row(
//                 children: [
//                   ElevatedButton(
//                       onPressed: () async {
//                         await dashBoardProvider.videoNumber++;
//                       },
//                       child: Text("Previous Video")),
//                 ],
//               ),
//             ],
//           ),
//         ));
//       },
//     );
//   }
// }
