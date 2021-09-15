// ignore_for_file: file_names, prefer_const_constructors

import 'package:course_organizer/View/CoursesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:course_organizer/View/TeacherInfo.dart';
import 'package:course_organizer/View/CourseChat.dart';

class TeacherCourseView extends StatefulWidget {
  const TeacherCourseView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeacherCourseView> createState() => _TeacherCourseViewPage();
}

class _TeacherCourseViewPage extends State<TeacherCourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normbre curso"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              minWidth: 250.0,
              height: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherInfo(
                            title: 'Lista de Estudiantes',
                          )),
                );
              },
              color: Colors.amber,
              child: Text('Estudiantes', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              minWidth: 250.0,
              height: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CourseChat(
                            title: 'Chat del curso',
                          )),
                );
              },
              color: Colors.amber,
              child: Text('Chat', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              minWidth: 250.0,
              height: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CoursesList(
                            title: 'Tareas del curso',
                          )),
                );
              },
              color: Colors.amber,
              child: Text('Tareas', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              minWidth: 250.0,
              height: 50.0,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CoursesList(
                            title: 'Noticias del curso',
                          )),
                );
              },
              color: Colors.amber,
              child: Text('Noticias', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
