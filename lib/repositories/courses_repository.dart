import 'package:haate_khori_app/database/course_queries.dart';
import 'package:haate_khori_app/models/course/courses_info.dart';

class CoursesRepository{



  Future<int> insertCourses(CoursesInfo coursesInfo){
    return CourseQueries().insertCourses(coursesInfo);
  }

  Future<bool> isCourseExist(CoursesInfo coursesInfo){
    return CourseQueries().isCourseExist(coursesInfo);
  }


  Future<List<CoursesInfo>> fetchCourses(){
    return CourseQueries().fetchCourses();
  }


}