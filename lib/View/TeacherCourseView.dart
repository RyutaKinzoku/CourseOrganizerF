// ignore_for_file: file_names, prefer_const_constructors

import 'package:course_organizer/View/CourseAssignments.dart';
import 'package:course_organizer/View/CourseNews.dart';
import 'package:course_organizer/View/CoursesList.dart';
import 'package:course_organizer/View/StudentsCourseList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minWidth: 250.0,
                height: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentsCourseList(
                              title:
                                  'Lista de Estudiantes ${widget.title.split(" ")[1]}',
                            )),
                  );
                },
                color: Colors.amber,
                child: Text('Estudiantes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minWidth: 250.0,
                height: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseChat(
                        title:
                            'Chat del curso ${widget.title.split(" ")[1]}',
                      )
                    ),
                  );
                },
                color: Colors.amber,
                child: Text('Chat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minWidth: 250.0,
                height: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CourseAssignments(
                              title:
                                  'Tareas del curso ${widget.title.split(" ")[1]}',
                            )),
                  );
                },
                color: Colors.amber,
                child: Text('Tareas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                minWidth: 250.0,
                height: 50.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseNews(
                        title:
                          'Noticias del curso ${widget.title.split(" ")[1]}',
                      )
                    ),
                  );
                },
                color: Colors.amber,
                child: Text('Noticias',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
