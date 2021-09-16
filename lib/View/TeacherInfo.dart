// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Docente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeacherInfo extends StatefulWidget {
  const TeacherInfo({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeacherInfo> createState() => _TeacherInfoPage();
}

class _TeacherInfoPage extends State<TeacherInfo> {
  var control = Controladora();

  Future<Docente> _getDocente(String idCurso) async {
    return await control.getDocenteDelCurso(idCurso);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _getDocente(widget.title.split(" ")[2]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data.getCedula()),
                Text('${snapshot.data.getNombre()} ${snapshot.data.getPrimerApellido()} ${snapshot.data.getSegundoApellido()} '),
                Text(snapshot.data.getEmail()),
                Text(snapshot.data.getCalificacion().toString()),
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('No se encontraron datos');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      ),
    );
  }
}
