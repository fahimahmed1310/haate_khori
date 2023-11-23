class CourseVideosInfo{
  dynamic courseVideoId;
  dynamic courseVideoLocation;
  dynamic courseVideoName;
  dynamic courseVideoThumbnail;


  CourseVideosInfo({
    this.courseVideoId,
    this.courseVideoLocation,
    this.courseVideoName,
    this.courseVideoThumbnail,
  });

  Map<String,dynamic> toMap(){
    return <String, dynamic> {
      "courseVideoId" : courseVideoId,
      "courseVideoLocation" : courseVideoLocation,
      "courseVideoName" : courseVideoName,
      "courseVideoThumbnail" : courseVideoThumbnail,
    };
  }

}