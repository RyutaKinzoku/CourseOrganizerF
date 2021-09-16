// ignore_for_file: file_names, prefer_final_fields

import 'package:course_organizer/Controller/DAO/dao.dart';
import 'package:course_organizer/Model/Usuario.dart';

class ManejoUsuarios {
  String _emailActual;
  var _db = DAO();

  ManejoUsuarios(this._emailActual);

  Future<bool> login(String email, String password) {
    return _db.login(email, password);
  }

  String getEmailActual() {
    return _emailActual;
  }

  Future<String> getRol(String email) {
    return _db.getRole(email);
  }

  Future<String> getCedula(String email) async {
    return await _db.getCedula(email);
  }
}
