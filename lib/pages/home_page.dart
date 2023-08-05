import 'package:flutter/material.dart';
import 'package:flutter_learn_todo_list/components/dialog_box.dart';
import 'package:flutter_learn_todo_list/components/todo_item.dart';
import 'package:flutter_learn_todo_list/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final box = Hive.box("todobox");
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (box.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([
        _controller.text,
        false,
      ]);
    });
    db.updateData();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop());
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: createNewTask, child: const Icon(Icons.add)),
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(title: const Text("Todo List"), elevation: 0),
        body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoItem(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
