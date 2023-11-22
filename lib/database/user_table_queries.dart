import 'package:haate_khori_app/database/database_helper.dart';
import 'package:haate_khori_app/models/user.dart';
import 'package:haate_khori_app/utils/constants/database_constants.dart';
import 'package:sqflite/sqflite.dart';

class UserTableQueries{


  static Future<bool> isUserExistWhenRegistration (String email) async{
    final db = await DatabaseHelper().initDatabase();
    final isExist = await db.rawQuery( "SELECT * from ${DatabaseConstants.USER_TABLE} WHERE email = '$email' ");
    if(isExist.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }



  static Future<bool> insertNewUser (User user) async{
    final db = await DatabaseHelper().initDatabase();
    int value = await db.insert(DatabaseConstants.USER_TABLE, user.toMap());
    if(value >0){
      return true;
    }else{
      return false;
    }
  }


  static Future<bool> isUserExistWhenLogin (User user) async{
    final db = await DatabaseHelper().initDatabase();
    final isExist = await db.rawQuery(
        "SELECT * from ${DatabaseConstants.USER_TABLE} WHERE email = '${user.email}' and password = '${user.password}'");
    if(isExist.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }



}