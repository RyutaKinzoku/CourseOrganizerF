// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_final_fields

import 'package:course_organizer/Controller/ManejoDocentes.dart';
import 'package:course_organizer/Controller/ManejoUsuarios.dart';
import 'package:course_organizer/Controller/ManejoEstudiantes.dart';
import 'package:course_organizer/Controller/ManejoCursos.dart';
import 'package:course_organizer/Model/Docente.dart';
import 'package:course_organizer/Model/Estudiante.dart';

class Controladora {
  var _manejoUsuarios = ManejoUsuarios("");
  var _manejoDocentes = ManejoDocentes();
  var _manejoEstudiantes = ManejoEstudiantes();
  var _manejoCursos = ManejoCursos();

  Future<bool> login(String email, String password) async {
    bool result = await _manejoUsuarios.login(email, password);
    if (result) {
      _manejoUsuarios = ManejoUsuarios(email);
    }
    return result;
  }

  Future<String> getRol(String email) async {
    return _manejoUsuarios.getRol(email);
  }

  //Docente
  void addDocente(String cedula, String nombre, String primerApellido,
      String segundoApellido, String email) {
    _manejoDocentes.add(cedula, nombre, primerApellido, segundoApellido, email);
  }

  void removeDocente(String cedula) {
    _manejoDocentes.remove(cedula);
  }

  Future<Docente> getDocente(String cedula) async {
    return await _manejoDocentes.get(cedula);
  }

  void calificarDocente(String cedula, int calificacion) {
    _manejoDocentes.calificar(cedula, calificacion);
  }

  Future<List<Docente>> getDocentes(String cedula) async {
    return await _manejoDocentes.getAll();
  }

  // Estudiante
  void addEstudiante(String cedula, String nombre, String primerApellido,
      String segundoApellido, String grado, String email) {
    _manejoEstudiantes.add(
        cedula, nombre, primerApellido, segundoApellido, grado, email);
  }

  void removeEstudiante(String cedula) {
    _manejoEstudiantes.remove(cedula);
  }

  Future<Estudiante> getEstudiante(String cedula) async {
    return await _manejoEstudiantes.get(cedula);
  }

  Future<List<Estudiante>> getEstudiantes(String cedula) async {
    return await _manejoEstudiantes.getAll();
  }

  //Cursos
  void addCurso(
      String idCurso, String nombre, String grado, List<String> horario) {
    _manejoCursos.add(idCurso, nombre, grado, horario);
  }

  void removeCurso(String idCurso) {
    _manejoCursos.remove(idCurso);
  }
/*
  Future<Estudiante> getEstudiante(String cedula) async {
    return await _manejoEstudiantes.get(cedula);
  }

  Future<List<Estudiante>> getEstudiantes(String cedula) async {
    return await _manejoEstudiantes.getAll();
  }
  */
}
