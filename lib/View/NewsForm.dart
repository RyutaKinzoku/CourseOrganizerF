// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Docente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewsForm extends StatefulWidget {
  const NewsForm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<NewsForm> createState() => _NewsFormPage();
}

class _NewsFormPage extends State<NewsForm> {
  String mensaje = "", idCurso = "";
  var control = Controladora();

  void _addNoticia() {
    control.addNoticia(mensaje, idCurso);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
                    mensaje = text;
                    idCurso = widget.title.split(" ")[2];
                  },
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Escriba el mensaje de su noticia...',
                  ),
                ),
              ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addNoticia,
          tooltip: 'Increment',
          child: const Icon(Icons.save),
        ),
      );
  }
}
