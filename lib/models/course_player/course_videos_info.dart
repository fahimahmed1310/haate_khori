class CourseVideosInfo{

  dynamic courseVideoId;
  dynamic courseVideoLocation;
  dynamic courseVideoName;
  dynamic courseVideoThumbnail;
  dynamic courseVideoFinished;

  CourseVideosInfo({
    this.courseVideoId,
    this.courseVideoLocation,
    this.courseVideoName,
    this.courseVideoThumbnail,
    this.courseVideoFinished
  });

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "courseVideoId" : courseVideoId,
      "courseVideoLocation" : courseVideoLocation,
      "courseVideoName" : courseVideoName,
      "courseVideoThumbnail" : courseVideoThumbnail,
      "courseVideoFinished": courseVideoFinished
    };
  }


}