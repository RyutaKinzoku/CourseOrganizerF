// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/DAO/dao.dart';
import 'package:course_organizer/Model/Estudiante.dart';

class ManejoEstudiantes {
  var _db = DAO();

  ManejoEstudiantes();

  void add(String cedula, String nombre, String primerApellido,
      String segundoApellido, String grado, String email) {
    _db.addEstudiante(cedula, nombre, primerApellido, segundoApellido, grado, email);
  }

  void remove(String cedula) {
    _db.removeEstudiante(cedula);
  }

  Future<Estudiante> get(String cedula) async {
    return await _db.getEstudiante(cedula);
  }

  Future<List<Estudiante>> getAll() async {
    return await _db.getEstudiantes();
  }
}
