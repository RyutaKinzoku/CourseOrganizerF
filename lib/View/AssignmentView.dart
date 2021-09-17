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
            return Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    Card(child:Text(snapshot.data.getTitulo(),
                      style: const TextStyle(fontSize: 20.0))),
                    Card(child: Text(snapshot.data.getDescripcion(),
                      style: const TextStyle(fontSize: 20.0)),),
                    Card(child: Text(snapshot.data.getFechaEntrega(),
                      style: const TextStyle(fontSize: 20.0)),),
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
    );
  }
}
