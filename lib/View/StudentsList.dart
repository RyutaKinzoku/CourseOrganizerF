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
    print(estudiantes);
    return FutureBuilder(
      future: getEstudiantes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Scaffold(
            appBar: AppBar(title: Text(widget.title)),
            body: Center(
              child: ListView.builder(
                itemCount: estudiantes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(estudiantes[index]),
                  );
                },
              ),
            ),
          );
        }
      },
    );
    return const SizedBox();
  }
}
