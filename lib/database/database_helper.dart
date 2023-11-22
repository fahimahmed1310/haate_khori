import 'dart:io';
import 'package:haate_khori_app/utils/constants/database_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{

  Future<Database> initDatabase() async{

    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, 'haate_khori.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
           "CREATE TABLE ${DatabaseConstants.USER_TABLE} ( userId INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT NOT NULL, password TEXT NOT NULL )"
               " "
         );

        },
    );


  }


}