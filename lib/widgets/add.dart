import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  final Function addTask;
  final TextEditingController addTaskController;

  const Add({
    Key? key,
    required this.addTask,
    required this.addTaskController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100, 25, 100, 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: addTaskController,
        onSubmitted: (value) {
          addTask(value);
          addTaskController.clear();
        },
        decoration: InputDecoration(
          hintText: "Add Task",
          prefixIcon: Icon(
            Icons.add,
            color: Colors.transparent,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {
              addTask(addTaskController.text);
              addTaskController.clear();
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
