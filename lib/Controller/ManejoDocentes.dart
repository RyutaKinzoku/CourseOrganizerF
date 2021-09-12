// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/DAO/dao.dart';
import 'package:course_organizer/Model/Docente.dart';

class ManejoDocentes {
  var _db = DAO();

  ManejoDocentes();

  void add(String cedula, String nombre, String primerApellido,
      String segundoApellido, String email) {
    _db.addDocente(cedula, nombre, primerApellido, segundoApellido, email);
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
}
