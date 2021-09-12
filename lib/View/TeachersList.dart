// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeachersList extends StatefulWidget {
  const TeachersList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeachersList> createState() => _TeachersListPage();
}

class _TeachersListPage extends State<TeachersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)));
  }
}
