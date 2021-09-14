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
  String cedula = "", nombre = "", primerApellido = "", segundoApellido = "", email = "", grado = "";
  var control = Controladora();

  Future<Estudiante> _getEstudiante(String cedula) async {
    return await control.getEstudiante(cedula);
  }

  void _addEstudiante() {
    control.addEstudiante(
        cedula, nombre, primerApellido, segundoApellido, grado, email);
  }

  void _setEstudiante() {
    control.setEstudiante(
        cedula, nombre, primerApellido, segundoApellido, email, grado);
  }

  void _removeEstudiante() {
    control.removeEstudiante(cedula);
  }

  @override
  Widget build(BuildContext context) {
    List<String> objetivo = widget.title.split(" ");
    if (objetivo[0] == "Agregar") {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  onChanged: (text) {
                    cedula = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cédula',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    nombre = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    primerApellido = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Primer Apellido',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    segundoApellido = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Segundo Apellido',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    email = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    grado = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Grado Escolar',
                  ),
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addEstudiante,
          tooltip: 'Increment',
          child: const Icon(Icons.save),
        ),
      );
    } else if (objetivo[0] == "Editar") {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: FutureBuilder(
            future: _getEstudiante(objetivo[1]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(),
                      TextFormField(
                        initialValue: snapshot.data.getCedula(),
                        onChanged: (text) {
                          cedula = text;
                        },
                        obscureText: false,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: "btn1",
                  onPressed: _removeEstudiante,
                  tooltip: 'Increment',
                  child: const Icon(Icons.delete),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: _setEstudiante,
                  tooltip: 'Increment',
                  child: const Icon(Icons.save),
                ),
              ],
            ),
          ));
    }
    return const SizedBox(); //Si no se cumple nada se retorna una pantalla en negro
  }
}
