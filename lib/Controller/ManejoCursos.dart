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

  Future<Curso> get(String idCurso) async {
    return await _db.getCurso(idCurso);
  }

  Future<List<Curso>> getAll() async {
    return await _db.getCursos();
  }

  void set(String idCurso, String nombre, String grado, List<String> horario) {
    _db.setCurso(idCurso, nombre, grado, horario);
  }
}
