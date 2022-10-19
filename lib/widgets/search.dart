import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Search extends StatelessWidget {
  final tasks;
  final Function filter;

  const Search({
    Key? key,
    required this.tasks,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 10, 50, 10),
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
        onChanged: (value) {
          filter(value);
        },
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            color: fg,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
