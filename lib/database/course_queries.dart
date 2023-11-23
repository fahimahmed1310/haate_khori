import 'package:flutter/cupertino.dart';
import 'package:haate_khori_app/database/database_helper.dart';
import 'package:haate_khori_app/models/course/courses_info.dart';
import 'package:haate_khori_app/utils/constants/database_constants.dart';


class CourseQueries{


  Future<int> insertCourses(CoursesInfo coursesInfo) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.COURSE_TABLE, coursesInfo.toMap());
    return value;
  }


  Future<bool> isCourseExist(CoursesInfo coursesInfo) async{
    final db = await DatabaseHelper().initDatabase();
    final mCourses = await db.rawQuery(" SELECT * FROM ${DatabaseConstants.COURSE_TABLE} where courseName = '${coursesInfo.courseName}'");
    if(mCourses.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }



  Future<List<CoursesInfo>> fetchCourses() async{
    final db = await DatabaseHelper().initDatabase();
    final mCourses = await db.rawQuery(" SELECT * FROM ${DatabaseConstants.COURSE_TABLE}");
    debugPrint(mCourses.length.toString());
    List<CoursesInfo> coursesInfo = List.generate(mCourses.length, (index){
      return CoursesInfo(
        courseId: mCourses[index]["courseId"],
        courseName: mCourses[index]["courseName"],
        courseTeacherName: mCourses[index]["courseTeacherName"],
        courseImage: mCourses[index]["courseImage"],
      );
    });
    if(coursesInfo.isNotEmpty){
      return coursesInfo;
    }else{
      return [];
    }
  }


}