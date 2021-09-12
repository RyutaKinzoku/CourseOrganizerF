// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeacherFunctions extends StatefulWidget {
  const TeacherFunctions({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeacherFunctions> createState() => _TeacherFunctionsPage();
}

class _TeacherFunctionsPage extends State<TeacherFunctions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Funciones de Docente")
      )
    );
  }
}
