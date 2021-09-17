// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/View/StudentView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentsListView extends StatefulWidget {
  const StudentsListView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentsListView> createState() => _StudentsListViewPage();
}

class _StudentsListViewPage extends State<StudentsListView> {
  var control = Controladora();
  var cedulaEstudiante = "";
  var idCurso = "";

  Future<List<String>> _getEstudiantes() async {
    return await control.getNombresEstudiantes();
  }

  void asignarEstudiante() {
    control.assignEstudiante(cedulaEstudiante, idCurso);
  }

  @override
  Widget build(BuildContext context) {
    idCurso = widget.title.split(" ")[1];
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getEstudiantes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  cedulaEstudiante = snapshot.data[index].split(" - ")[0];
                  return Card(
                      child: ListTile(
                          title: Text(snapshot.data[index]),
                          onTap: () {
                            Navigator.pop(context);
                            /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentView(
                                title: 'Editar ${}',
                          )
                        )
                      );
                      */
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
                  builder: (context) => const StudentView(
                        title: 'Agregar Estudiante',
                      )));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
