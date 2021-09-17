// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Estudiante.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentView extends StatefulWidget {
  const StudentView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentView> createState() => _StudentViewPage();
}

class _StudentViewPage extends State<StudentView> {
  String cedula = "",
      nombre = "",
      primerApellido = "",
      segundoApellido = "",
      email = "",
      grado = "";
  var control = Controladora();

  Future<Estudiante> _getEstudiante(String cedula) async {
    return await control.getEstudiante(cedula);
  }

  @override
  Widget build(BuildContext context) {
    List<String> objetivo = widget.title.split(" ");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getEstudiante(objetivo[1]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            cedula = snapshot.data.getCedula();
            nombre = snapshot.data.getNombre();
            primerApellido = snapshot.data.getPrimerApellido();
            segundoApellido = snapshot.data.getSegundoApellido();
            email = snapshot.data.getEmail();
            grado = snapshot.data.getGrado();
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(),
                  TextFormField(
                    initialValue: snapshot.data.getCedula(),
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cédula',
                    ),
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getNombre(),
                    onChanged: (text) {
                      nombre = text;
                    },
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre',
                    ),
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getPrimerApellido(),
                    onChanged: (text) {
                      primerApellido = text;
                    },
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Primer Apellido',
                    ),
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getSegundoApellido(),
                    onChanged: (text) {
                      segundoApellido = text;
                    },
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Segundo Apellido',
                    ),
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getEmail(),
                    onChanged: (text) {
                      email = text;
                    },
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo',
                    ),
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getGrado(),
                    onChanged: (text) {
                      grado = text;
                    },
                    obscureText: false,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Grado Escolar',
                    ),
                  ),
                ]);
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
