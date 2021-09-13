// ignore_for_file: file_names, prefer_final_fields

class Noticia {
  String _idNoticia, _mensaje;

  Noticia(this._idNoticia, this._mensaje);

  String getIdNoticia() {
    return _idNoticia;
  }

  String getMensaje() {
    return _mensaje;
  }

  void setMensaje(String pMensaje) {
    _mensaje = pMensaje;
  }
}
