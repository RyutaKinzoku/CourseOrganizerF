// ignore_for_file: file_names, prefer_final_fields
class Mensaje {
  String _idMensaje, _contenido, _fechaEnvio, _idCurso, _emailEmisor, _emisor;

  Mensaje(this._idMensaje, this._contenido, this._fechaEnvio, this._idCurso,
      this._emailEmisor, this._emisor);

  String getIdMensaje() {
    return _idMensaje;
  }

  String getContenido() {
    return _contenido;
  }

  String getFechaEnvio() {
    return _fechaEnvio;
  }

  String getIdCurso() {
    return _idCurso;
  }

  String getEmailEmisor() {
    return _emailEmisor;
  }

  String getEmisor() {
    return _emisor;
  }
}
