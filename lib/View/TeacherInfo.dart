// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeacherInfo extends StatefulWidget {
  const TeacherInfo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeacherInfo> createState() => _TeacherInfoPage();
}

class _TeacherInfoPage extends State<TeacherInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)));
  }
}
