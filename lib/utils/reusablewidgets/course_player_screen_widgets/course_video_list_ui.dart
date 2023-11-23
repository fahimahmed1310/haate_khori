import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:haate_khori_app/providers/course_video_provider.dart';
import 'package:haate_khori_app/utils/constants/app_constants.dart';
import 'package:provider/provider.dart';

class CourseVideoListUi extends StatefulWidget {

  final int? selectedIndex;

  CourseVideoListUi({this.selectedIndex});


  @override
  State<CourseVideoListUi> createState() => _CourseVideoListUiState();

}

class _CourseVideoListUiState extends State<CourseVideoListUi> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CourseVideoProvider>(
      builder: (_,courseVideoProvider,___){
        return Container(
          padding: EdgeInsets.all(
              MediaQuery.of(context).size.height * 0.01),
          decoration:  BoxDecoration(
              color: courseVideoProvider.selectedVideoIndex == widget.selectedIndex ? Colors.white : AppConstants.secondaryColor
          ),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "${courseVideoProvider.fetchedCourseVideoInfo[widget.selectedIndex!].courseVideoId}.",
                    style:  TextStyle(
                        fontFamily: "Acme",
                        fontSize: 20,
                        color: courseVideoProvider.selectedVideoIndex == widget.selectedIndex ? Colors.black : Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04 ,
                  ),
                  Text(
                    "${courseVideoProvider.fetchedCourseVideoInfo[widget.selectedIndex!].courseVideoName}",
                    style:  TextStyle(
                        fontFamily: "Acme",
                        fontSize: 20,
                        color: courseVideoProvider.selectedVideoIndex == widget.selectedIndex? Colors.black : Colors.white),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02 ,
                  ),
                   Icon(
                    FontAwesomeIcons.circlePlay,
                    color: courseVideoProvider.selectedVideoIndex == widget.selectedIndex ? Colors.red :  Colors.white,
                  ),
                ],
              ),
               Icon(FontAwesomeIcons.circleCheck,
                  color:Colors.green,
                  //courseVideoProvider.fetchedCourseVideoFinished.contains(courseVideoProvider.fetchedCourseVideoInfo[widget.selectedIndex!].courseVideoName) ? Colors.green : Colors.grey

              )
            ],
          ),
        );
      }
    );
  }
}