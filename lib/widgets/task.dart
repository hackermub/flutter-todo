import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Task extends StatelessWidget {
  final String title;
  final int id;
  final bool isDone;
  final Function changeDone;
  final Function deleteTask;

  const Task({
    Key? key,
    required this.id,
    required this.title,
    required this.isDone,
    required this.changeDone,
    required this.deleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeDone(id);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
        padding: EdgeInsets.fromLTRB(50, 25, 50, 25),
        decoration: BoxDecoration(
          color: isDone ? colorDone : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.blue,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                decoration: isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                deleteTask(id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
