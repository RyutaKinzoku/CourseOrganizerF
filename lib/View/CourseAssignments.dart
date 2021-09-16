// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Tarea.dart';
import 'package:course_organizer/View/AssignmentView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseAssignments extends StatefulWidget {
  const CourseAssignments({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CourseAssignments> createState() => _CourseAssignmentsPage();
}

class _CourseAssignmentsPage extends State<CourseAssignments> {
  var control = Controladora();
  String cedula = "";

  Future<List<Tarea>> _getTareas(String idCurso) async {
    return await control.getTareas(idCurso);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _getTareas(widget.title.split(" ")[3]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].getTitulo()),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AssignmentView(
                              title:
                                'Tarea ${snapshot.data[index].getIdTarea()} - ${snapshot.data[index].getTitulo()}',
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
