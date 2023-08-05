import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];

  final box = Hive.box("todobox");

  // run this for first time user
  void createInitialData() {
    todoList = [
      ["Learn Flutter", false],
      ["Workout", true]
    ];
    box.put("TODOLIST", todoList);
  }

  void loadData() {
    todoList = box.get("TODOLIST");
  }

  void updateData() {
    box.put("TODOLIST", todoList);
  }
}
