// ignore_for_file: file_names

import 'package:course_organizer/Model/Rol.dart';

class Usuario {
  String _email, _password;
  Rol _role;

  Usuario(this._email, this._password, this._role); // Constructor

  String getEmail() {
    return _email;
  }

  Rol getRol() {
    return _role;
  }
}
