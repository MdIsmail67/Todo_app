import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screen/todolist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _textController = TextEditingController();
  String newTodoTask = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.addListener(() {
      newTodoTask = _textController.text;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTodoTask);
    Navigator.pop(context);

    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showDialogueText() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Add Your New Task"),
            content: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Enter Your New Task....',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onSubmitted: (context) => _submit(),
            ),
            actions: [ElevatedButton(onPressed:_submit, child: Text("Submit"))],
          );
        },
      );
    }

    return Scaffold(
      body: TodolistScreen(), // Keeping your To-Do list inside



      appBar: AppBar(
        title: Text("TO DO APP"),
        backgroundColor: Colors.teal.shade200,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialogueText();
        },
        child: Icon(Icons.add, color: Colors.teal[300]),
      ),
      backgroundColor: Colors.purple[100],
    );
  }
}
