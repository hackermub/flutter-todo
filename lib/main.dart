import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './constants/colors.dart';
import './widgets/search.dart';
import './widgets/todo.dart';
import './widgets/add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tasks = [
    {
      "id": 1,
      "title": "Task 1",
      "isDone": false,
    },
    {
      "id": 2,
      "title": "Task 2",
      "isDone": false,
    },
    {
      "id": 3,
      "title": "Task 3",
      "isDone": false,
    },
  ];

  var filteredTasks, searchValue = "";

  final addTaskController = TextEditingController();

  void changeDone(int id) {
    for (var task in tasks) {
      if (task['id'] == id) {
        setState(() {
          task['isDone'] = task['isDone'] == false;
        });
        return;
      }
    }
  }

  void filter(String value) {
    searchValue = value;
    if (value == '') {
      setState(() {
        filteredTasks = tasks;
      });
      return;
    }
    setState(() {
      filteredTasks = tasks
          .where((task) => task['title']
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  void deleteTask(int id) {
    tasks.removeWhere((task) => task['id'] == id);
    filter(searchValue);
  }

  @override
  void initState() {
    filteredTasks = tasks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.list,
                color: fg,
                size: 50,
              ),
              Text(
                "ToDo",
                style: TextStyle(
                  fontSize: 30,
                  color: fg,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Search(
              tasks: tasks,
              filter: filter,
            ),
            ToDo(
              tasks: filteredTasks.reversed.toList(),
              changeDone: changeDone,
              deleteTask: deleteTask,
            ),
            Add(
              addTaskController: addTaskController,
              addTask: (value) {
                tasks.add({
                  'id': DateTime.now().millisecondsSinceEpoch.toInt(),
                  'title': value,
                  'isDone': false,
                });
                filter(searchValue);
              },
            )
          ],
        ),
      ),
    );
  }
}
