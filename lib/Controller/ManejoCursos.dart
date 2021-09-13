// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/DAO/dao.dart';
import 'package:course_organizer/Model/Curso.dart';
import 'package:course_organizer/Model/Mensaje.dart';
import 'package:course_organizer/Model/Noticia.dart';
import 'package:course_organizer/Model/Tarea.dart';

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

  void addNoticia(String mensaje, String idCurso) {
    _db.addNoticia(mensaje, idCurso);
  }

  void removeNoticia(String idNoticia) {
    _db.removeNoticia(idNoticia);
  }

  Future<Noticia> getNoticia(String idNoticia) async {
    return await _db.getNoticia(idNoticia);
  }

  Future<List<Noticia>> getAllNoticias(String idCurso) async {
    return await _db.getAllNoticias(idCurso);
  }

  void setNoticia(String idNoticia, String mensaje, String idCurso) {
    _db.setNoticia(idCurso, mensaje, idCurso);
  }

  void addMensaje(
      String contenido, String fechaEnvio, String idCurso, String emisor) {
    _db.addMensaje(contenido, fechaEnvio, idCurso, emisor);
  }

  Future<Mensaje> getMensaje(String idMensaje) async {
    return await _db.getMensaje(idMensaje);
  }

  Future<List<Mensaje>> getAllMensajes(String idCurso) async {
    return await _db.getAllMensajes(idCurso);
  }

  void addTarea(String descripcion, String fechaEntrega, String idCurso) {
    _db.addTarea(descripcion, fechaEntrega, idCurso);
  }

  void removeTarea(String idTarea) {
    _db.removeTarea(idTarea);
  }

  Future<Tarea> getTarea(String idTarea) async {
    return await _db.getTarea(idTarea);
  }

  Future<List<Tarea>> getAllTareas(String idCurso) async {
    return await _db.getAllTareas(idCurso);
  }

  void setTarea(String descripcion, String fechaEntrega, String idCurso) {
    _db.setTarea(descripcion, fechaEntrega, idCurso);
  }
}
