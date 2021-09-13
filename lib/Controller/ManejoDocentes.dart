// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/DAO/dao.dart';
import 'package:course_organizer/Model/Docente.dart';
import 'dart:math';

class ManejoDocentes {
  var _db = DAO();

  ManejoDocentes();

  void add(String cedula, String nombre, String primerApellido,
      String segundoApellido, String email) {
    String contrasena = "";
    var rng = Random();
    for (var i = 0; i < 4; i++) {
      contrasena = contrasena + rng.nextInt(9).toString();
    }
    _db.addDocente(
        cedula, nombre, primerApellido, segundoApellido, email, contrasena);
  }

  void remove(String cedula) {
    _db.removeDocente(cedula);
  }

  Future<Docente> get(String cedula) async {
    return await _db.getDocente(cedula);
  }

  void calificar(String cedula, int calificacion) {
    _db.calificarDocente(cedula, calificacion);
  }

  Future<List<Docente>> getAll() async {
    return await _db.getDocentes();
  }

  void set(String cedula, String nombre, String primerApellido,
      String segundoApellido, String email) {
    _db.setDocentes(cedula, nombre, primerApellido, segundoApellido, email);
  }
}
