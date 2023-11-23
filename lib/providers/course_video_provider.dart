import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/course_player/course_videos_info.dart';
import 'package:haate_khori_app/models/course_player/course_videos_list.dart';
import 'package:haate_khori_app/repositories/course_video_repository.dart';

class CourseVideoProvider with ChangeNotifier{

  List<CourseVideosInfo> _fetchedCourseVideoInfo = [];
  final CourseVideosList _courseVideosList = CourseVideosList();
  bool _isInsertAllVideos = false;
  bool _isFetchAllVideos = false;






  List<CourseVideosInfo> get fetchedCourseVideoInfo => _fetchedCourseVideoInfo;
  set fetchedCourseVideoInfo(List<CourseVideosInfo> value) {
    _fetchedCourseVideoInfo = value;
    notifyListeners();
  }







  get isInsertAllVideos => _isInsertAllVideos;
  set isInsertAllVideos(value) {
    _isInsertAllVideos = value;
    notifyListeners();
  }


  bool get isFetchAllVideos => _isFetchAllVideos;
  set isFetchAllVideos(bool value) {
    _isFetchAllVideos = value;
    notifyListeners();
  }

  Future<void> insertCourseVideos() async {
    int value = 0;
    bool courseVideoExist;
    for (CourseVideosInfo courseVideosInfo
        in _courseVideosList.courseVideosList) {
      courseVideoExist =
          await CourseVideoRepository().isCourseVideoExist(courseVideosInfo);
      if (courseVideoExist == false) {
        value =
            await CourseVideoRepository().insertCourseVideos(courseVideosInfo);
      } else {
        continue;
      }
    }
    if (value > 0) {
      isInsertAllVideos = true;
    } else {
      isInsertAllVideos = false;
    }
    notifyListeners();
  }



  Future<void> fetchCourseVideos()async{
    fetchedCourseVideoInfo = await CourseVideoRepository().fetchCourseVideos();
    if(fetchedCourseVideoInfo.isNotEmpty){
      isFetchAllVideos = true;
    }
    else{
      isFetchAllVideos = false;
    }
    notifyListeners();
  }




}