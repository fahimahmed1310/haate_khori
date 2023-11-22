import 'package:flutter/material.dart';
import 'package:haate_khori_app/screens/course_player_screen.dart';


class CourseDisplayUi extends StatefulWidget {

  final String? courseImageLocation;
  final String? courseName;
  final String? courseTeacher;


  CourseDisplayUi({@required this.courseImageLocation,@required this.courseName,@required this.courseTeacher});

  @override
  State<CourseDisplayUi> createState() => _CourseDisplayUiState();
}

class _CourseDisplayUiState extends State<CourseDisplayUi> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration:  BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    widget.courseImageLocation!,
                  ),
                  fit: BoxFit.cover,
              ),
            ),
          ),
           Flexible(
            child: Text(
              widget.courseName!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: "Acme",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),
           Flexible(
            child: Text(
              widget.courseTeacher!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontFamily: "Acme",
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white
              ),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white
              ),
              onPressed:(){

                // Navigator.push(context, MaterialPageRoute(builder: (context){
                //   return VideoApp();
                // }));
              },
              child: const Text(
                "Continue Course",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Acme"
                ),
              )
          ),
        ],
      ),
    );
  }
}