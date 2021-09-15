// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseChat extends StatefulWidget {
  const CourseChat({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CourseChat> createState() => _CourseChatPage();
}

class _CourseChatPage extends State<CourseChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)));
  }
}
