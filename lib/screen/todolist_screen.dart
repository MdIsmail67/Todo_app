import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);
    return ListView.builder(
        itemCount: task.allTask.length,
        itemBuilder:(context,index)=>  ListTile(
          leading: Checkbox(value: task.allTask[index].iscompleted,
              onChanged: (context) => task.completeTask(task.allTask[index])
          ),
          title: Text(task.allTask[index].todoTitle),
          trailing: IconButton(onPressed: (){
            task.deleteTask(task.allTask[index]);
          }, icon: Icon(Icons.delete)),
        )
    
    );
  }

}
