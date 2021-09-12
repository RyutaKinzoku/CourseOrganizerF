// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:course_organizer/Controller/ManejoUsuarios.dart';

class Controladora {
  var _manejoUsuarios = ManejoUsuarios("");

  Future<bool> login(String email, String password) async {
    bool result = await _manejoUsuarios.login(email, password);
    if (result) {
      _manejoUsuarios = ManejoUsuarios(email);
    }
    return result;
  }

  Future<String> getRol(String email) async {
    return _manejoUsuarios.getRol(email);
  }
}
