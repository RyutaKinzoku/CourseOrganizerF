// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:course_organizer/Controller/DAO/dao.dart';

class Controladora {
  var db = DAO();
  bool login(String email, password) {
    return db.login(email, password);
  }
}
