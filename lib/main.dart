import 'package:flutter/material.dart';
import 'package:flutter_learn_todo_list/components/todo_item.dart';
import 'package:flutter_learn_todo_list/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Init Hive

  await Hive.initFlutter();
  await Hive.openBox("todobox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
