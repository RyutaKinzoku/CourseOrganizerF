// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_final_fields

import 'package:course_organizer/Controller/ManejoDocentes.dart';
import 'package:course_organizer/Controller/ManejoUsuarios.dart';
import 'package:course_organizer/Controller/ManejoEstudiantes.dart';
import 'package:course_organizer/Controller/ManejoCursos.dart';
import 'package:course_organizer/Model/Curso.dart';
import 'package:course_organizer/Model/Mensaje.dart';
import 'package:course_organizer/Model/Docente.dart';
import 'package:course_organizer/Model/Estudiante.dart';
import 'package:course_organizer/Model/Noticia.dart';
import 'package:course_organizer/Model/Tarea.dart';

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

  Future<List<Docente>> getDocentes() async {
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

  Future<List<Estudiante>> getEstudiantes() async {
    return await _manejoEstudiantes.getAll();
  }

  Future<List<String>> getNombresEstudiantes() async {
    List<String> nombresEstudiantes = [];
    List<Estudiante> estudiantes = await getEstudiantes();

    for (var e in estudiantes) {
      nombresEstudiantes.add(e.getNombre() +
          " " +
          e.getPrimerApellido() +
          " " +
          e.getSegundoApellido());
    }
    return nombresEstudiantes;
  }

  //Cursos
  void addCurso(
      String idCurso, String nombre, String grado, List<String> horario) {
    _manejoCursos.add(idCurso, nombre, grado, horario);
  }

  void removeCurso(String idCurso) {
    _manejoCursos.remove(idCurso);
  }

  Future<Curso> getCurso(String idCurso) async {
    return await _manejoCursos.get(idCurso);
  }

  Future<List<Curso>> getCursos() async {
    return await _manejoCursos.getAll();
  }

  void setCurso(
      String idCurso, String nombre, String grado, List<String> horario) {
    _manejoCursos.set(idCurso, nombre, grado, horario);
  }

  //Noticias
  void addNoticia(String mensaje, String idCurso) {
    _manejoCursos.addNoticia(mensaje, idCurso);
  }

  void removeNoticia(String idNoticia) {
    _manejoCursos.removeNoticia(idNoticia);
  }

  Future<Noticia> getNoticia(String idNoticia) async {
    return await _manejoCursos.getNoticia(idNoticia);
  }

  Future<List<Noticia>> getNoticias(String idCurso) async {
    return await _manejoCursos.getAllNoticias(idCurso);
  }

  void setNoticia(String idNoticia, String mensaje, String idCurso) {
    _manejoCursos.setNoticia(idCurso, mensaje, idCurso);
  }

  //Mensajes
  void addMensaje(
      String contenido, String fechaEnvio, String idCurso, String emisor) {
    _manejoCursos.addMensaje(contenido, fechaEnvio, idCurso, emisor);
  }

  Future<Mensaje> getMensaje(String idMensaje) async {
    return await _manejoCursos.getMensaje(idMensaje);
  }

  Future<List<Mensaje>> getMensajes(String idCurso) async {
    return await _manejoCursos.getAllMensajes(idCurso);
  }

  //Tareas
  void addTarea(String descripcion, String fechaEntrega, String idCurso) {
    _manejoCursos.addTarea(descripcion, fechaEntrega, idCurso);
  }

  void removeTarea(String idTarea) {
    _manejoCursos.removeTarea(idTarea);
  }

  Future<Tarea> getTarea(String idTarea) async {
    return await _manejoCursos.getTarea(idTarea);
  }

  Future<List<Tarea>> getTareas(String idCurso) async {
    return await _manejoCursos.getAllTareas(idCurso);
  }

  void setTarea(String descripcion, String fechaEntrega, String idCurso) {
    _manejoCursos.setTarea(descripcion, fechaEntrega, idCurso);
  }
}
