// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:course_organizer/View/TeacherView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeachersList extends StatefulWidget {
  const TeachersList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TeachersList> createState() => _TeachersListPage();
}

class _TeachersListPage extends State<TeachersList> {
  var control = Controladora();

  Future<List<String>> _getDocentes() async {
    return await control.getNombresDocentes();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: _getDocentes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data[index]),
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeacherView(
                                title: 'Editar ${snapshot.data[index].split(" - ")[0]}',
                          )
                        )
                      );
                    }
                  )
                );
              }
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TeacherView(
                    title: 'Agregar Docente',
              )
            )
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
