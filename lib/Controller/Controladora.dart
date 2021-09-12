// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:course_organizer/Controller/DAO/dao.dart';

class Controladora {
  var db = DAO();
  Future<bool> login(String email, password) async {
    return db.login(email, password);
  }

  Future<String> getRole(String email) async {
    return db.getRole(email);
  }
}
