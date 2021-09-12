// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentsList> createState() => _StudentsListPage();
}

class _StudentsListPage extends State<StudentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)));
  }
}
