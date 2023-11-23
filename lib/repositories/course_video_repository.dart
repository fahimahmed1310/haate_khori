import 'package:haate_khori_app/database/course_video_queries.dart';
import 'package:haate_khori_app/models/course_player/course_videos_info.dart';

class CourseVideoRepository{

  Future<int> insertCourseVideos(CourseVideosInfo courseVideosInfo){
    return CourseVideoQueries().insertCourseVideos( courseVideosInfo);
  }


  Future<bool> isCourseVideoExist(CourseVideosInfo courseVideosInfo){
    return CourseVideoQueries().isCourseVideoExist(courseVideosInfo);
  }




  Future<List<CourseVideosInfo>> fetchCourseVideos(){
    return CourseVideoQueries().fetchCourseVideos();
  }

}