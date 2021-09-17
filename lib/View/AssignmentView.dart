// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Tarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AssignmentView extends StatefulWidget {
  const AssignmentView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AssignmentView> createState() => _AssignmentViewPage();
}

class _AssignmentViewPage extends State<AssignmentView> {
  var control = Controladora();
  String descripcion = "", fechaEntrega = "", titulo = "";

  Future<Tarea> _getTarea(String idTarea) async {
    return await control.getTarea(idTarea);
  }

  void _removeTarea() {
    control.removeTarea(widget.title.split(" ")[1]);
  }

  void _setTarea() {
    control.setTarea(
        widget.title.split(" ")[1], descripcion, fechaEntrega, titulo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _getTarea(widget.title.split(" ")[1]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    initialValue: snapshot.data.getTitulo(),
                    style: const TextStyle(fontSize: 20.0),
                    onChanged: (text) {
                      titulo = text;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getDescripcion(),
                    style: const TextStyle(fontSize: 20.0),
                    onChanged: (text) {
                      descripcion = text;
                    },
                  ),
                  TextFormField(
                    initialValue: snapshot.data.getFechaEntrega(),
                    style: const TextStyle(fontSize: 20.0),
                    onChanged: (text) {
                      fechaEntrega = text;
                    },
                  ),
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
              onPressed: _removeTarea,
              tooltip: 'Increment',
              child: const Icon(Icons.delete),
            ),
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: _setTarea,
              tooltip: 'Increment',
              child: const Icon(Icons.save),
            ),
          ],
        ),
      ),
    );
  }
}
