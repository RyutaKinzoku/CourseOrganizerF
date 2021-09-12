// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Model/Rol.dart';

class Usuario {
  String _email, _password;
  Rol _role;

  Usuario(this._email, this._password, this._role); // Constructor

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }

  Rol getRol() {
    return _role;
  }
}
