import 'package:flutter/material.dart';

import './task.dart';

class ToDo extends StatelessWidget {
  final tasks;
  final changeDone;
  final deleteTask;

  const ToDo({
    Key? key,
    required this.tasks,
    required this.changeDone,
    required this.deleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Task(
            id: tasks[index]['id'],
            title: tasks[index]['title'],
            isDone: tasks[index]['isDone'],
            changeDone: changeDone,
            deleteTask: deleteTask,
          );
        },
      ),
    );
  }
}
