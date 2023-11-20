class CoursesInfo{
  dynamic courseId;
  dynamic courseName;
  dynamic courseTeacherName;
  dynamic courseImage;


  CoursesInfo({this.courseId, this.courseName, this.courseTeacherName, this.courseImage});

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      "courseName" : courseName,
      "courseTeacherName" : courseTeacherName,
      "courseImage": courseImage
    };
  }


}