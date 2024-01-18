// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_list/dialog_box.dart';
import 'package:todo_list/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //text controller
  final _controller = TextEditingController();

//List of todo tasks
  List toDoList = [
    ["Do morning devotion", false],
    ["Flutter challenge", true],
    ["Watch start up video", false],
    ["Practice communications", false],
    ["Study 3 Bible chapters", false],
  ];

  //Checkbox change checker - changes to opposite value when checked 
void checkBoxChanged(bool? value, int index){
  setState(() {
    toDoList[index][1] = !toDoList[index][1] ;
  });
}

//Save task
void addNewTask(){
  setState(() {
    toDoList.add([_controller.text, false]);
  });
  _controller.clear();
  Navigator.of(context).pop();
}

  //Create new task method
 void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onCancel:() => Navigator.of(context).pop() , //returns to the initial page
          onSave: addNewTask,
          );
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.deepPurple[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Center(
          child: Text("To Do", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, ),)),
      ),
      //Add circular button
      floatingActionButton: FloatingActionButton(onPressed: () {
        createNewTask();
      },
      child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index){
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index)
            );
        }
        )

    );
  }
}