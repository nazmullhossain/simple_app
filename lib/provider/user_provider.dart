
import 'package:flutter/material.dart';
import 'package:sqftask/model/user_model.dart';

import '../pages/helper/local_helper.dart';
class UserProvider with ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  UserProvider() {
    getInfo();
  }

  List<UserModel> allInfo = [];

  getInfo() async {
    allInfo = await DbHelper.dbHelper.getAllRecipes();

    notifyListeners();
  }


  insertNewRecipe() {
  UserModel userModel=UserModel(title: titleController.text, description: desController.text);
    DbHelper.dbHelper.insertNewRecipe(userModel);
  getInfo();
  }


}