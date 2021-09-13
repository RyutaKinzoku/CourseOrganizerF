// ignore_for_file: file_names, prefer_final_fields

class Noticia {
  String _idNoticia, _mensaje, _idCurso;

  Noticia(this._idNoticia, this._mensaje, this._idCurso);

  String getIdNoticia() {
    return _idNoticia;
  }

  String getMensaje() {
    return _mensaje;
  }

  String getIdCurso() {
    return _idCurso;
  }
}
