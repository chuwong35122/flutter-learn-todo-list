import 'package:flutter/material.dart';
import 'package:flutter_learn_todo_list/components/custom_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        content: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Task Name",
                      hintText: "Add new task"),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(text: "Save", onPressed: onSave),
                    const SizedBox(width: 10),
                    CustomButton(text: "Cancel", onPressed: onCancel)
                  ],
                )
              ],
            )));
  }
}
