// ignore_for_file: sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool  taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({super.key,
            required this.taskName,
            required this.taskCompleted,
            required this.onChanged
          });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:18, right: 18, top: 18),
      child: Container(
        padding: EdgeInsets.all(18),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 

              //task
            Text(taskName, style: 
              TextStyle(color: Colors.white, 
              decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none),
              ),    

            //checkbox
            Checkbox(
              value: taskCompleted, 
              onChanged: onChanged,
              activeColor: Colors.white,
              checkColor: Colors.deepPurple,
              ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(5),
        )
      ),
    );
  }
}