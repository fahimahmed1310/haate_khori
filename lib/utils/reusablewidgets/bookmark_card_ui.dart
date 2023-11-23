import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/course_video_provider.dart';
import 'package:provider/provider.dart';

class BookmarkCardUi extends StatelessWidget {
  final int? buildIndex;

  BookmarkCardUi({this.buildIndex});

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseVideoProvider>(
        builder: (_, courseVideoProvider, ___) {
      return Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
        ),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.02,
              right: MediaQuery.of(context).size.width * 0.02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseVideoProvider
                      .bookmarkVideoList[buildIndex!].courseName!,
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Acme",
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseVideoProvider
                          .bookmarkVideoList[buildIndex!].videoName!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Acme",
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      courseVideoProvider
                          .bookmarkVideoList[buildIndex!].bookmarkedTime!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: "Acme",
                          color: Colors.blue,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
