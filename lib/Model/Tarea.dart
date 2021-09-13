// ignore_for_file: file_names
class Tarea {
  String _idTarea, _descripcion, _idCurso;
  DateTime _fechaEntrega;

  Tarea(this._idTarea, this._descripcion, this._fechaEntrega, this._idCurso);

  String getIdTarea() {
    return _idTarea;
  }

  String getDescripcion() {
    return _descripcion;
  }

  DateTime getFechaEntrega() {
    return _fechaEntrega;
  }

  String getIdCurso() {
    return _idCurso;
  }
}
