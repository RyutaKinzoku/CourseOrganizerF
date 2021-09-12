// ignore_for_file: file_names, prefer_final_fields

class Estudiante {
  String _cedula, _nombre, _primerApellido, _segundoApellido, _grado, _email;

  Estudiante(this._cedula, this._nombre, this._primerApellido,
      this._segundoApellido, this._grado, this._email);

  String getCedula() {
    return _cedula;
  }

  String getNombre() {
    return _nombre;
  }

  String getPrimerApellido() {
    return _primerApellido;
  }

  String getSegundoApellido() {
    return _segundoApellido;
  }

  String getEmail() {
    return _email;
  }

  String getGrado() {
    return _grado;
  }
}
