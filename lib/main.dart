import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqftask/pages/helper/local_helper.dart';
import 'package:sqftask/pages/home_page.dart';
import 'package:sqftask/provider/user_provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>UserProvider()),
      ],
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
