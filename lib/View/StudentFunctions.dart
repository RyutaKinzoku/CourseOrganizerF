// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/View/StudentCourseView.dart';
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
  String cedula = "";

  Future<List<String>> _getCursosEstudiante(String cedula) async {
    return await control.getNombresCursosEstudiante(cedula);
  }

  Future<String> _getCedula(String email) async {
    return await control.getCedulaUsuario(email);
  }

  Future<List<String>> _getCursosUsuario(String email) async {
    var cedula = await _getCedula(email);
    return _getCursosEstudiante(cedula);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _getCursosUsuario(widget.title.split(" ")[2]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index]),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentCourseView(
                            title:
                              'Curso ${snapshot.data[index]}',
                          )
                        )
                      );
                    }
                  )
                );
              }
            );
          } else if (snapshot.hasError) {
            return const Text('No se encontraron datos');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
