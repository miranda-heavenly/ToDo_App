// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_list/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller; 
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Get user input
            TextField(
              controller: controller, //allows us to have access to what user types
              decoration: InputDecoration(
                // border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            //Save and cancel buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //save button
                MyButton(text: "Save", onPressed: onSave),
                //add a gap between buttons
                const SizedBox(width: 10,),
                //Cancel button
                MyButton(text: "Cancel", onPressed:onCancel),
              ],
            )
          ],
        ),
      ),

    );
  }
}