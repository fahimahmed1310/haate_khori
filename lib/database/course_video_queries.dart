import 'package:flutter/cupertino.dart';
import 'package:haate_khori_app/database/database_helper.dart';
import 'package:haate_khori_app/models/course_player/course_videos_info.dart';
import 'package:haate_khori_app/utils/constants/database_constants.dart';


class CourseVideoQueries{


  Future<int> insertCourseVideos(CourseVideosInfo courseVideosInfo) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.COURSE_VIDEO_INFO_TABLE,courseVideosInfo.toMap());
    return value;
  }



  Future<bool> isCourseVideoExist (CourseVideosInfo courseVideosInfo) async{
    final db = await DatabaseHelper().initDatabase();
    final mCoursesVideo = await db.rawQuery(" SELECT * FROM ${DatabaseConstants.COURSE_VIDEO_INFO_TABLE} where courseVideoLocation = '${courseVideosInfo.courseVideoLocation}' and courseVideoName = '${courseVideosInfo.courseVideoName}'");
    if(mCoursesVideo.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }


  Future<List<CourseVideosInfo>> fetchCourseVideos() async{
    final db = await DatabaseHelper().initDatabase();
    final mVideos = await db.rawQuery(" SELECT * FROM ${DatabaseConstants.COURSE_VIDEO_INFO_TABLE}");
    debugPrint("Fetch Course Query Print 1" +mVideos.length.toString());
    List<CourseVideosInfo> coursesVideoInfo = List.generate(mVideos.length, (index){
      return CourseVideosInfo(
        courseVideoId: mVideos[index]["courseVideoId"],
        courseVideoLocation: mVideos[index]["courseVideoLocation"],
        courseVideoName: mVideos[index]["courseVideoName"],
        courseVideoThumbnail: mVideos[index]["courseVideoThumbnail"],
      );
    });
    debugPrint("Fetch Course Query Print 2 " + coursesVideoInfo.length.toString());
    if(coursesVideoInfo.isNotEmpty){
      return coursesVideoInfo;
    }else{
      return [];
    }
  }



}