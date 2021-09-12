import 'package:course_organizer/Model/Rol.dart';
import 'package:course_organizer/Model/Usuario.dart';
import 'package:mysql1/mysql1.dart';

class DAO {
  static String host = 'mysql-49257-0.cloudclusters.net',
      user = 'admin',
      password = 'x1vKfOKm',
      db = 'Aketech';
  static int port = 11674;

  DAO();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }

  Future<bool> login(String email, String password) async {
    var conn = await getConnection();
    var results = await conn.query(
        'select email, contrasena from Usuario where email = ?', [email]);
    return results.isNotEmpty && results.first[1] == password;
  }

  Future<String> getRole(String email) async {
    var conn = await getConnection();
    var results =
        await conn.query('select rol from Usuario where email = ?', [email]);
    return results.first[0];
  }

  Future<Usuario?> getUsuario(String email) async {
    var conn = await getConnection();
    var results = await conn.query(
        'select email, contrasena, from Usuario where email = ?', [email]);
    if (results.first[2] == "Estudiante") {
      return Usuario(results.first[0], results.first[1], Rol.Estudiante);
    } else if (results.first[2] == "Docente") {
      return Usuario(results.first[0], results.first[1], Rol.Docente);
    } else if (results.first[2] == "Administrador") {
      return Usuario(results.first[0], results.first[1], Rol.Administrador);
    }
    return null;
  }
}
