// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/DAO/dao.dart';
import 'package:course_organizer/Model/Curso.dart';

class ManejoCursos {
  var _db = DAO();

  ManejoCursos();

  void add(String idCurso, String nombre, String grado, List<String> horario) {
    _db.addCurso(idCurso, nombre, grado, horario);
  }

  void remove(String idCurso) {
    _db.removeCurso(idCurso);
  }
/*
  Future<Estudiante> get(String cedula) async {
    return await _db.getEstudiante(cedula);
  }

  Future<List<Estudiante>> getAll() async {
    return await _db.getEstudiantes();
  }*/
}
