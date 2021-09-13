// ignore_for_file: file_names
class Mensaje {
  String _idMensaje, _contenido, _fechaEnvio, _idCurso, _emisor;

  Mensaje(this._idMensaje, this._contenido, this._fechaEnvio, this._idCurso,
      this._emisor);

  String getIdMensaje() {
    return _idMensaje;
  }

  String getContenido() {
    return _contenido;
  }

  String getFechaEnvio() {
    return _fechaEnvio;
  }
}
