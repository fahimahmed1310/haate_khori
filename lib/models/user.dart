class User{

  dynamic userId;
  dynamic email;
  dynamic password;

  User({this.userId, this.email, this.password});

  Map<String, dynamic> toMap(){
    return <String,dynamic>{
      "userId" : userId,
      "email" : email,
      "password" : password
    };
  }



}