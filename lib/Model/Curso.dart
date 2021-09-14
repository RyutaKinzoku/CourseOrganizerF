// ignore_for_file: file_names, prefer_final_fields
import 'package:course_organizer/Model/Noticia.dart';

class Curso {
  int _idCurso;
  String _nombre, _grado;
  List<String> _horario;

  Curso(this._idCurso, this._nombre, this._grado, this._horario);

  int getIdCurso() {
    return _idCurso;
  }

  String getNombre() {
    return _nombre;
  }

  String getGrado() {
    return _grado;
  }

  List<String> getHorario() {
    return _horario;
  }
}
