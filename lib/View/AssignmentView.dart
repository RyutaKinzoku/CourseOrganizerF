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
  String cedula = "";

  Future<Tarea> _getTarea(String idTarea) async {
    return await control.getTarea(idTarea);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: FutureBuilder(
        future: _getTarea(widget.title.split(" ")[1]),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(snapshot.data.getTitulo()),
                Text(snapshot.data.getDescripcion()),
                Text(snapshot.data.getFechaEntrega()),
              ],
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
    );
  }
}
