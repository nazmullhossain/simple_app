import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:sqftask/widget/utisl_widget.dart';

String uri="http://192.168.0.104:3000";
void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
})async{
  switch(response.statusCode){
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context,jsonDecode(response.body)['msg']);
      break;
    default:
      showSnackBar(context,response.body);

  }
}