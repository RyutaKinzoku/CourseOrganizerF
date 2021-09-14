// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/View/StudentsList.dart';
import 'package:course_organizer/Model/Docente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeacherView> createState() => _TeacherViewPage();
}

class _TeacherViewPage extends State<TeacherView> {
  late String cedula, nombre, primerApellido, segundoApellido, email, grado;
  var control = Controladora();

  Future<Docente> _getDocente(String cedula) async {
    return await control.getDocente(cedula);
  }

  void _setDocente() {
    control.setDocente(cedula, nombre, primerApellido, segundoApellido, email);
  }

  void _removeDocente() {
    control.removeDocente(cedula);
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
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const StudentsList(
                  title: 'Lista de Docentes',
                )
              ),
            );
          },
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
          future: _getDocente(objetivo[1]),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                heroTag: "btn1",
                onPressed: _removeDocente,
                tooltip: 'Increment',
                child: const Icon(Icons.delete),
              ),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: _setDocente,
                tooltip: 'Increment',
                child: const Icon(Icons.save),
              ),
            ],
          ),
        )
      );
    }
    return const SizedBox(); //Si no se cumple nada se retorna una pantalla en negro
  }
}
