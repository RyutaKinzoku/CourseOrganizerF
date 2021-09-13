import 'package:course_organizer/Model/Docente.dart';
import 'package:course_organizer/Model/Estudiante.dart';
import 'package:course_organizer/Model/Rol.dart';
import 'package:course_organizer/Model/Usuario.dart';
import 'package:course_organizer/Model/Curso.dart';
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
    var results = await conn.query('select * from Docente');
    for (var row in results) {
      docentes.add(Docente(row[0], row[1], row[2], row[3], row[4], row[5]));
    }
    return docentes;
  }

  //Estudiante
  Future<void> addEstudiante(
      String cedula,
      String nombre,
      String primerApellido,
      String segundoApellido,
      String grado,
      String email) async {
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
        await conn.query('select * from Estudiante where cedula = ?', [cedula]);
    return Estudiante(results.first[0], results.first[1], results.first[2],
        results.first[3], results.first[4], results.first[5]);
  }

  Future<List<Estudiante>> getEstudiantes() async {
    List<Estudiante> estudiantes = [];
    var conn = await getConnection();
    var results = await conn.query('select * from Estudiante');
    for (var row in results) {
      estudiantes
          .add(Estudiante(row[0], row[1], row[2], row[3], row[4], row[5]));
    }
    return estudiantes;
  }

  Future<void> addCurso(
      String idCurso, String nombre, String grado, List<String> horario) async {
    var conn = await getConnection();
    conn.query(
        'insert into Curso (ID_Curso, nombre, gradoEscolar) values (?, ?, ?)',
        [idCurso, nombre, grado]);
    horario.forEach((tiempo) {
      var partes = tiempo.split(" ");
      conn.query(
          'insert into CursoPorDia (ID_Curso, dia, horaInicio, horaFin) values (?, ?, ?, ?)',
          [idCurso, partes[1], partes[2], partes[3]]);
    });
  }

  Future<void> removeCurso(String idCurso) async {
    var conn = await getConnection();
    conn.query('delete from Curso where ID_Curso = ?', [idCurso]);
    conn.query('delete from CursoPorDia where ID_Curso = ?', [idCurso]);
  }

  Future<Curso> getCurso(String idCurso) async {
    var conn = await getConnection();
    var results1 =
        await conn.query('select * from Curso where ID_Curso = ?', [idCurso]);
    var results2 = await conn
        .query('select * from CursoPorDia where ID_Curso = ?', [idCurso]);
    List<String> horario = [];
    for (var row in results2) {
      horario.add(
          "$row[4] $row[1] $row[2] $row[3]"); //Estructura "ID Dia HoraInicio HoraFin"
    }
    return Curso(results1.first[0], results1.first[1], results1.first[2],
        horario); //Curso(ID_Curso, nombre, gradoEscolar, horario)
  }

  Future<List<Curso>> getCursos() async {
    List<Curso> cursos = [];
    var conn = await getConnection();
    var results = await conn.query('select * from Curso');
    for (var curso in results) {
      List<String> horario = [];
      var results2 = await conn
          .query('select * from CursoPorDia where ID_Curso = ?', [curso[0]]);
      for (var row in results2) {
        horario.add(
            "$row[4] $row[1] $row[2] $row[3]"); //Estructura "ID Dia HoraInicio HoraFin"
      }
      cursos.add(Curso(curso[0], curso[1], curso[2],
          horario)); //Curso(ID_Curso, nombre, gradoEscolar, horario)
    }
    return cursos;
  }

  Future<void> setCurso(
      String idCurso, String nombre, String grado, List<String> horario) async {
    var conn = await getConnection();
    conn.query(
        'update Curso set nombre = ?, gradoEscolar = ? where ID_Curso = ?',
        [nombre, grado, idCurso]);
    horario.forEach((tiempo) {
      var partes = tiempo.split(" ");
      conn.query(
          'update CursoPorDia set dia = ?, horaInicio = ?, horaFin = ? where idCurso = ? and dia = "Martes"',
          [idCurso, partes[0], partes[1], grado[2]]);
    });
  }
}
