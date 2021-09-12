// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CoursesList> createState() => _CoursesListPage();
}

class _CoursesListPage extends State<CoursesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)));
  }
}
