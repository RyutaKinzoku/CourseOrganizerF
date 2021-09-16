// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Curso.dart';
import 'package:course_organizer/View/CourseView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CoursesList> createState() => _CoursesListPage();
}

class _CoursesListPage extends State<CoursesList> {
  var control = Controladora();
  String cedula = "";

  Future<List<String>> _getCursos() async {
    return await control.getNombresCursos();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.title == "Lista de Cursos") {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getCursos(),
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
                                      builder: (context) => CourseView(
                                            title:
                                                'Editar ${snapshot.data[index].split(" - ")[0]}',
                                          )));
                            }));
                  });
            } else if (snapshot.hasError) {
              return const Text('No se encontraron datos');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CourseView(
                          title: 'Agregar Curso',
                        )));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
    } else if (widget.title == "Matrícula") {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getCursos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                            title: Text(snapshot.data[index]),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CourseView(
                                            title:
                                                'Matrícula ${snapshot.data[index].split(" - ")[0]}',
                                          )));
                            }));
                  });
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
    return const SizedBox(); //Si no se cumple nada se retorna una pantalla en negro
  }
}
