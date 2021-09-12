// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Enrollment> createState() => _EnrollmentPage();
}

class _EnrollmentPage extends State<Enrollment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.title)));
  }
}
