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
  String calificacion = "", cedulaDocente = "";

  Future<Docente> _getDocente(String idCurso) async {
    return await control.getDocenteDelCurso(idCurso);
  }

  Future<void> calificar() async {
    control.calificarDocente(cedulaDocente, await control.getCedulaUsuario(control.getEmailActual()), int.parse(calificacion));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
          future: _getDocente(widget.title.split(" ")[2]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(snapshot.data.getCedula(),
                        style: const TextStyle(fontSize: 20.0)),
                    Text(
                        '${snapshot.data.getNombre()} ${snapshot.data.getPrimerApellido()} ${snapshot.data.getSegundoApellido()}',
                        style: const TextStyle(fontSize: 20.0)),
                    Text(snapshot.data.getEmail(),
                        style: const TextStyle(fontSize: 20.0)),
                    Text(
                        "Calificación: ${snapshot.data.getCalificacion().toString()}",
                        style: const TextStyle(fontSize: 20.0)),
                    TextField(
                      onChanged: (text) {
                        calificacion = text;
                        cedulaDocente = snapshot.data.getCedula();
                      },
                    ),
                    MaterialButton(
                      onPressed: calificar,
                      color: Colors.amber,
                      child: const Text('Calificar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return const Text('No se encontraron datos');
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
