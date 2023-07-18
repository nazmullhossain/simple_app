import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:sqftask/model/user_model.dart';
import 'package:sqftask/widget/eror_widget.dart';
import 'package:sqftask/widget/utisl_widget.dart';

import '../../provider/user_provider.dart';

class InfoService {
  void sendData(
      {required BuildContext context,
      required String title,
      required String des}) async {
    try {
      UserModel userModel = UserModel(title: title, description: des);

      http.Response res = await http.post(
        Uri.parse("$uri/api/info-post"),
        body: jsonEncode(userModel.toMap()),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
        },
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "data send sucessfully");
          });
    } catch (e) {}
  }


 Future <List<UserModel>> getData(BuildContext context)async {
   final userProvider = Provider.of<UserProvider>(context, listen: false);
   List<UserModel> userData = [];
   try {
     http.Response res = await http.get(Uri.parse("$uri/api/get-info"),
         headers: {
           'Content-Type': 'application/json; charset=UTF-8',}
     );

     print("data${res.body}");

     httpErrorHandle(
       response: res,
       context: context,
       onSuccess: () {
         for (int i = 0; i < jsonDecode(res.body).length; i++) {
           userData.add(
             UserModel.fromJson(
               jsonEncode(
                 jsonDecode(res.body)[i],
               ),
             ),
           );
         }
       },
     );
   } catch (e) {

   }
   print("user data ${userData}");
   return userData;

 }
 }

