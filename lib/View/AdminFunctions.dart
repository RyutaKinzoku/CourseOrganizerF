// ignore_for_file: file_names, prefer_const_constructors

import 'package:course_organizer/View/CoursesList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:course_organizer/View/StudentsList.dart';
import 'package:course_organizer/View/TeachersList.dart';

class AdminFunctions extends StatefulWidget {
  const AdminFunctions({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AdminFunctions> createState() => _AdminFunctionsPage();
}

class _AdminFunctionsPage extends State<AdminFunctions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funciones de Administrador"),
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
                        builder: (context) => StudentsList(
                              title: 'Lista de Estudiantes',
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
                        builder: (context) => TeachersList(
                              title: 'Lista de Docentes',
                            )),
                  );
                },
                color: Colors.amber,
                child: Text('Docentes',
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
                        builder: (context) => CoursesList(
                              title: 'Lista de Cursos',
                            )),
                  );
                },
                color: Colors.amber,
                child: Text('Cursos',
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
                        builder: (context) => CoursesList(
                              title: 'Matrícula',
                            )),
                  );
                },
                color: Colors.amber,
                child: Text('Matricula',
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
