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

  bool login(String email, password) {
    bool res = false;
    getConnection().then((conn) {
      String sql = 'select email, contrasena from Usuario where email = ?';
      conn.query(sql, [email]).then((results) {
        res = results.isNotEmpty;
        print(results);
      });
    });
    print(res);
    return res;
  }
}
