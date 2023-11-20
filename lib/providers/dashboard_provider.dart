import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/my_courses_info_list.dart';

class DashBoardProvider with ChangeNotifier{

  //variables

  final MyCoursesInfoList _myCoursesInfoList = MyCoursesInfoList();



  //Getter and Setter

  MyCoursesInfoList get myCoursesInfoList => _myCoursesInfoList;



}