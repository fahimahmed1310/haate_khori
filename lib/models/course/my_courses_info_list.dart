import 'package:haate_khori_app/models/course/courses_info.dart';

class MyCoursesInfoList{

   final List<CoursesInfo> _coursesInfoList =[

    CoursesInfo(
      courseName: "The Complete Flutter Bootcamp",
      courseTeacherName: "Dr. Angela Yu",
      courseImage: "assets/images/my_course_images/my_course_1.jpg"
    ),

    CoursesInfo(

        courseName: "The Ultimate Dart & Flutter",
        courseTeacherName: "Rivaan Ranawat",
        courseImage: "assets/images/my_course_images/my_course_2.jpg"
    ),

    CoursesInfo(
        courseName: "Flutter & Firebase Tutorial",
        courseTeacherName: "Rivaan Ranawat",
        courseImage: "assets/images/my_course_images/my_course_3.jpg"
    ),

    CoursesInfo(

        courseName: "Flutter Advanced Course with MVVM",
        courseTeacherName: "Mina Farid",
        courseImage: "assets/images/my_course_images/my_course_4.jpg"
    ),


  ];

   List<CoursesInfo>  getCoursesInfoList (){
    return _coursesInfoList;
  }

}