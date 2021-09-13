// ignore_for_file: file_names
class Tarea {
  String _idTarea, _descripcion, _fechaEntrega, _idCurso, _titulo;

  Tarea(this._idTarea, this._descripcion, this._fechaEntrega, this._idCurso,
      this._titulo);

  String getIdTarea() {
    return _idTarea;
  }

  String getDescripcion() {
    return _descripcion;
  }

  String getFechaEntrega() {
    return _fechaEntrega;
  }

  String getIdCurso() {
    return _idCurso;
  }

  String getTitulo() {
    return _titulo;
  }
}
