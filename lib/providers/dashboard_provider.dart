import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/course/courses_info.dart';
import 'package:haate_khori_app/models/course/my_courses_info_list.dart';
import 'package:haate_khori_app/repositories/courses_repository.dart';

class DashBoardProvider with ChangeNotifier{

  final MyCoursesInfoList _myCoursesInfoList = MyCoursesInfoList();
  final _coursesInfo = CoursesInfo();
  List<CoursesInfo> _fetchedCoursesList = [];
  int? _selectedMyCourseId = 0; // from my courses, the selected course id that I want to continue will be stored here
  bool? _isInsertionComplete = false;



  MyCoursesInfoList get myCoursesInfoList => _myCoursesInfoList;

  int get selectedMyCourseId => _selectedMyCourseId!;

  set selectedMyCourseId(int value) {
    _selectedMyCourseId = value;
    notifyListeners();
  }

  get coursesInfo => _coursesInfo;


  bool get isInsertionComplete => _isInsertionComplete!;

  set isInsertionComplete(bool value) {
    _isInsertionComplete = value;
    notifyListeners();
  }


  List<CoursesInfo> get fetchedCoursesList => _fetchedCoursesList;
  set fetchedCoursesList(List<CoursesInfo> value) {
    _fetchedCoursesList = value;
    notifyListeners();
  }





  Future<void> insertCourses()async{
    bool courseExist;
    int value = 0;
    for(CoursesInfo coursesInfo in myCoursesInfoList.getCoursesInfoList()){
      courseExist = await CoursesRepository().isCourseExist(coursesInfo);
      if(courseExist == false){
        value = await CoursesRepository().insertCourses(coursesInfo);
      }else{
        continue;
      }
    }
    if(value>0){
      debugPrint(value.toString());
      isInsertionComplete = true;
    }else{
      isInsertionComplete = false;
    }
    notifyListeners();
  }

  Future<void> fetchCourses()async{
    fetchedCoursesList = await CoursesRepository().fetchCourses();
    if(fetchedCoursesList.isNotEmpty){
      notifyListeners();
    }else{
      debugPrint(fetchedCoursesList.length.toString());
      notifyListeners();
    }
  }









}