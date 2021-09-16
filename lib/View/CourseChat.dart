// ignore_for_file: file_names

import 'dart:ui';

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/Model/Mensaje.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseChat extends StatefulWidget {
  const CourseChat({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CourseChat> createState() => _CourseChatPage();
}

class _CourseChatPage extends State<CourseChat> {
  var control = Controladora();
  Future<List<Mensaje>> _getMensajes(String idCurso) async {
    var a = await control.getMensajes(idCurso);
    //print(a);
    return a;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Stack(
        children: <Widget>[
          FutureBuilder(
            future: _getMensajes(widget.title.split(' ')[3]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                ListView.builder(
                  itemCount: snapshot.data.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 10, bottom: 10),
                      child: Text(snapshot.data[index].getIdMensaje()),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('No se encontraron datos');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
              return const SizedBox(); //Si no se cumple nada se retorna una pantalla en negro
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 15),
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                        hintText: "Haz una pregunta...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  )),
                  const SizedBox(width: 15),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.send, color: Colors.white, size: 18),
                    backgroundColor: Colors.amber,
                    elevation: 0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
