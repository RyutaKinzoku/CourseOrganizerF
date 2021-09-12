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
}
