// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Noticia.dart';
import 'package:course_organizer/Model/Tarea.dart';
import 'package:course_organizer/View/AssignmentView.dart';
import 'package:course_organizer/View/NewsForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseNews extends StatefulWidget {
  const CourseNews({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CourseNews> createState() => _CourseNewsPage();
}

class _CourseNewsPage extends State<CourseNews> {
  var control = Controladora();
  String cedula = "";

  Future<List<Noticia>> _getNoticias(String idCurso) async {
    return await control.getNoticias(idCurso);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _getNoticias(widget.title.split(" ")[3]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index].getMensaje()),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsForm(
                        title: 'Agregar Noticia ${widget.title.split(" ")[3]}',
                      )));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}