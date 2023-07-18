

// ignore_for_file: file_names
import 'dart:io';


import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqftask/model/user_model.dart';

class DbHelper {
  late Database database;
  static DbHelper dbHelper = DbHelper();
  final String tableName = 'info';
  final String titleColumn = 'title';
  final String desColumn = 'des';
  final String idColumn = 'id';


  initDatabase() async {
    database = await connectToDatabase();
  }

  Future<Database> connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '$directory/recipes.db';
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $titleColumn TEXT, $desColumn TEXT)');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute(
            'CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT, $titleColumn TEXT, $desColumn TEXT)');
      },
      onDowngrade: (db, oldVersion, newVersion) {
        db.delete(tableName);
      },
    );
  }

  Future<List<UserModel>> getAllRecipes() async {
    List<Map<String, dynamic>> tasks = await database.query(tableName);
    return tasks.map((e) => UserModel.fromMap(e)).toList();
  }

  insertNewRecipe(UserModel userModel) {
    database.insert(tableName, userModel.toMap());
  }

  deleteRecipe(UserModel userModel) {
    database
        .delete(tableName, where: '$idColumn=?', whereArgs: [userModel.id]);
  }

  deleteRecipes() {
    database.delete(tableName);
  }


}