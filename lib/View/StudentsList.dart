// ignore_for_file: file_names

import 'package:course_organizer/Controller/Controladora.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StudentsList> createState() => _StudentsListPage();
}

class _StudentsListPage extends State<StudentsList> {
  var control = Controladora();
  List<String> estudiantes = [];

  Future<List<String>> getEstudiantes() async {
    return await control.getNombresEstudiantes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getEstudiantes(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(snapshot.data[index]),
                  );
                });
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
    //return const SizedBox();
  }
}
