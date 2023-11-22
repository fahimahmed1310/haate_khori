import 'package:haate_khori_app/database/user_table_queries.dart';
import 'package:haate_khori_app/models/user.dart';

class AuthenticationRepository{

  static Future<bool> isUserExistWhenRegistration (String email){
    return UserTableQueries.isUserExistWhenRegistration(email);
  }

  static Future<bool> insertNewUser (User user){
    return UserTableQueries.insertNewUser(user);
  }

  static Future<bool> isUserExistWhenLogin (User user){
    return UserTableQueries.isUserExistWhenLogin(user);
  }


}