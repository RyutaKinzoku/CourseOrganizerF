// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdminFunctions extends StatefulWidget {
  const AdminFunctions({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<AdminFunctions> createState() => _AdminFunctionsPage();
}

class _AdminFunctionsPage extends State<AdminFunctions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Funciones de Administrador")
      )
    );
  }
}
