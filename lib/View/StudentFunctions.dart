// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentFunctions extends StatefulWidget {
  const StudentFunctions({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentFunctions> createState() => _StudentFunctionsPage();
}

class _StudentFunctionsPage extends State<StudentFunctions> {
    var control = Controladora();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cursos Estudiante")
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("data")
          ]
        ),
      ),
    );
  }
}
