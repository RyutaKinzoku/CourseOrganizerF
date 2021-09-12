import 'package:course_organizer/Model/Docente.dart';
import 'package:course_organizer/Model/Estudiante.dart';
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

  //Docente
  Future<void> addDocente(String cedula, String nombre, String primerApellido,
      String segundoApellido, String email) async {
    var conn = await getConnection();
    conn.query(
        'insert into Docente (cedula, nombre, primerApellido, segundoApellido, calificacion, email) values (?, ?, ?, ?, ?, ?)',
        [cedula, nombre, primerApellido, segundoApellido, 0, email]);
  }

  Future<void> removeDocente(String cedula) async {
    var conn = await getConnection();
    conn.query('delete from Docente where cedula = ?', [cedula]);
  }

  Future<Docente> getDocente(String cedula) async {
    var conn = await getConnection();
    var results =
        await conn.query('select * from Docente where cedula = ?', [cedula]);
    return Docente(results.first[0], results.first[1], results.first[2],
        results.first[3], results.first[4], results.first[5]);
  }

  Future<void> calificarDocente(String cedula, int calificacion) async {
    var conn = await getConnection();
    conn.query('update Docente set calificacion = ? where `cedula` = ?;',
        [calificacion, cedula]);
  }

  Future<List<Docente>> getDocentes() async {
    List<Docente> docentes = [];
    var conn = await getConnection();
    var results = await conn.query('select * from Docente where cedula');
    for (var row in results) {
      docentes.add(Docente(row[0], row[1], row[2], row[3], row[4], row[5]));
    }
    return docentes;
  }
  
  //Estudiante
  Future<void> addEstudiante(String cedula, String nombre, String primerApellido, String segundoApellido, String grado, String email) async {
    var conn = await getConnection();
    conn.query(
        'insert into Estudiante (cedula, nombre, primerApellido, segundoApellido, grado, email) values (?, ?, ?, ?, ?, ?)',
        [cedula, nombre, primerApellido, segundoApellido, grado, email]);
  }

  Future<void> removeEstudiante(String cedula) async {
    var conn = await getConnection();
    conn.query('delete from Estudiante where cedula = ?', [cedula]);
  }

  Future<Estudiante> getEstudiante(String cedula) async {
    var conn = await getConnection();
    var results =
        await conn.query('select * from Docente where cedula = ?', [cedula]);
    return Estudiante(results.first[0], results.first[1], results.first[2],
        results.first[3], results.first[4], results.first[5]);
  }

  Future<List<Estudiante>> getEstudiantes() async {
    List<Estudiante> estudiantes = [];
    var conn = await getConnection();
    var results = await conn.query('select * from Docente where cedula');
    for (var row in results) {
      estudiantes.add(Estudiante(row[0], row[1], row[2], row[3], row[4], row[5]));
    }
    return estudiantes;
  }
}
