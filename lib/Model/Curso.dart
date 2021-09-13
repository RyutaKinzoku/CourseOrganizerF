// ignore_for_file: file_names, prefer_final_fields
import 'package:course_organizer/Model/Noticia.dart';

class Curso {
  String _idCurso, _nombre, _grado, _horaInicio, _horaFin;
  List<String> _dias;
  List<Noticia> _noticias = [];
  List<String> _mensajes = [];
  List<String> _tareas = [];

  Curso(this._idCurso, this._nombre, this._grado, this._horaInicio,
      this._horaFin, this._dias);

  String getIdCurso() {
    return _idCurso;
  }

  String getNombre() {
    return _nombre;
  }

  String getGrado() {
    return _grado;
  }

  String getHoraInicio() {
    return _horaInicio;
  }

  String getHoraFin() {
    return _horaFin;
  }

  List<Noticia> getNoticias() {
    return _noticias;
  }

  void eliminarNoticias(String pIdNoticia) {
    _noticias.removeWhere((noticia) => noticia.getIdNoticia() == pIdNoticia);
  }

  void setNoticia(String pIdNoticia, String pMensaje) {
    var noticia =
        _noticias.where((noticia) => noticia.getIdNoticia() == pIdNoticia);
  }
}
