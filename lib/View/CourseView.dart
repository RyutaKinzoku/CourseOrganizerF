// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Curso.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CourseView> createState() => _CourseViewPage();
}

class _CourseViewPage extends State<CourseView> {
  int _idCurso = -1;
  String _nombre = "", _grado = "";
  List<String> _horario = [];
  var control = Controladora();

  Future<Curso> _getCurso(String idCurso) async {
    return await control.getCurso(idCurso);
  }

  Future<List<String>> _getMiembros(int idCurso) async {
    return await control.getMiembros(idCurso);
  }

  void _addCurso() {
    control.addCurso(_nombre, _grado, _horario);
  }

  void _setCurso() {
    control.setCurso(_idCurso, _nombre, _grado, _horario);
  }

  void _removeCurso() {
    control.removeCurso(_idCurso);
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
                    _idCurso = int.parse(text);
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ID del Curso',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    _nombre = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
                TextFormField(
                  onChanged: (text) {
                    _grado = text;
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Grado',
                  ),
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addCurso,
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
            future: _getCurso(objetivo[1]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(),
                      TextFormField(
                        initialValue: snapshot.data.getIdCurso().toString(),
                        onChanged: (text) {
                          _idCurso = int.parse(text);
                        },
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'ID del Curso',
                        ),
                      ),
                      TextFormField(
                        initialValue: snapshot.data.getNombre(),
                        onChanged: (text) {
                          _nombre = text;
                        },
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Nombre',
                        ),
                      ),
                      TextFormField(
                        initialValue: snapshot.data.getGrado(),
                        onChanged: (text) {
                          _grado = text;
                        },
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Grado',
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
                  onPressed: _removeCurso,
                  tooltip: 'Increment',
                  child: const Icon(Icons.delete),
                ),
                FloatingActionButton(
                  heroTag: "btn2",
                  onPressed: _setCurso,
                  tooltip: 'Increment',
                  child: const Icon(Icons.save),
                ),
              ],
            ),
          ));
    } else if (objetivo[0] == "Matrícula") {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: _getMiembros(int.parse(objetivo[1])),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      initialValue: snapshot.data[0],
                      onChanged: (text) {
                        _idCurso = int.parse(text);
                      },
                      obscureText: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Docente',
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.all(10),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minWidth: 100.0,
                              height: 50.0,
                              onPressed: () {},
                              color: Colors.amber,
                              child: const Text('Desasignar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: const EdgeInsets.all(10),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              minWidth: 100.0,
                              height: 50.0,
                              onPressed: () {},
                              color: Colors.amber,
                              child: const Text('Asignar',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  )),
                            ),
                          ),
                        ]
                      )
                    ),
                    const Text("Estudiantes:"),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        if (index > 0) {
                          return Card(
                              child: ListTile(
                            title: Text(snapshot.data[index]),
                          ));
                        }
                        return const Card();
                      }
                    )
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
    return const SizedBox(); //Si no se cumple nada se retorna una pantalla en negro
  }
}
