import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<ToDoModel> _tasksList = [];
  UnmodifiableListView<ToDoModel> get allTask =>
      UnmodifiableListView(_tasksList);

  void addTask(String task) {
    _tasksList.add(ToDoModel(todoTitle: task, iscompleted: false));
    notifyListeners();
  }
  void completeTask(ToDoModel task){
    final taskIndex = _tasksList.indexOf(task);
    _tasksList[taskIndex].toDoCompleted();
    notifyListeners();
  }
  void deleteTask(ToDoModel task){
    _tasksList.remove(task);
    notifyListeners();
  }
}
