class ToDoModel{
  String todoTitle;
  bool iscompleted;


  ToDoModel({required this.todoTitle,this.iscompleted = false});

  void toDoCompleted(){
    iscompleted = ! iscompleted;
  }

}