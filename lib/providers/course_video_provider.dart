import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/bookmark.dart';
import 'package:haate_khori_app/models/course_player/course_videos_info.dart';
import 'package:haate_khori_app/models/course_player/course_videos_list.dart';
import 'package:haate_khori_app/models/course_videos_complete.dart';
import 'package:haate_khori_app/repositories/course_video_repository.dart';

class CourseVideoProvider with ChangeNotifier{

  List<CourseVideosInfo> _fetchedCourseVideoInfo = [];
  List<Bookmark> _bookmarkVideoList = [];
  List<CourseVideosComplete> _courseVideosComplete = [];
  final CourseVideosList _courseVideosList = CourseVideosList();
  String? _courseName;
  String? _userEmail;
  bool _isInsertAllVideos = false;
  bool _isFetchAllVideos = false;
  bool _isVideoOpened = false;
  int _selectedVideoIndex = 0;
  bool _isFetchAllFinishedVideos = false;






  List<CourseVideosInfo> get fetchedCourseVideoInfo => _fetchedCourseVideoInfo;
  set fetchedCourseVideoInfo(List<CourseVideosInfo> value) {
    _fetchedCourseVideoInfo = value;
    notifyListeners();
  }


  List<Bookmark> get bookmarkVideoList => _bookmarkVideoList;
  set bookmarkVideoList(List<Bookmark> value) {
    _bookmarkVideoList = value;
    notifyListeners();
  }


  List<CourseVideosComplete> get courseVideosComplete => _courseVideosComplete;
  set courseVideosComplete(List<CourseVideosComplete> value) {
    _courseVideosComplete = value;
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



  bool get isVideoOpened => _isVideoOpened;
  set isVideoOpened(bool value) {
    _isVideoOpened = value;
    notifyListeners();
  }


  int get selectedVideoIndex => _selectedVideoIndex;

  set selectedVideoIndex(int value) {
    _selectedVideoIndex = value;
    notifyListeners();
  }


  String get courseName => _courseName!;

  set courseName(String value) {
    _courseName = value;
    notifyListeners();
  }


  String get userEmail => _userEmail!;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }


  bool get isFetchAllFinishedVideos => _isFetchAllFinishedVideos;

  set isFetchAllFinishedVideos(bool value) {
    _isFetchAllFinishedVideos = value;
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
    isFetchAllVideos = false;
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