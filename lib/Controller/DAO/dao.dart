// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:course_organizer/Model/Docente.dart';
import 'package:course_organizer/Model/Estudiante.dart';
import 'package:course_organizer/Model/Rol.dart';
import 'package:course_organizer/Model/Usuario.dart';
import 'package:course_organizer/Model/Curso.dart';
import 'package:course_organizer/Model/Mensaje.dart';
import 'package:course_organizer/Model/Tarea.dart';
import 'package:course_organizer/Model/Noticia.dart';
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
      String segundoApellido, String email, String contrasena) async {
    var conn = await getConnection();
    conn.query('insert into Usuario (email, contrasena, rol) values (?, ?, ?)',
        [email, contrasena, "Docente"]);
    conn.query(
        'insert into Persona (cedula, nombre, primerApellido, segundoApellido, email) values (?, ?, ?, ?, ?)',
        [cedula, nombre, primerApellido, segundoApellido, email]);
    conn.query(
        'insert into Docente (cedula, nombre, primerApellido, segundoApellido, calificacion, email) values (?, ?, ?, ?, ?, ?)',
        [cedula, nombre, primerApellido, segundoApellido, 0, email]);
  }

  Future<void> removeDocente(String cedula) async {
    var conn = await getConnection();
    conn.query('delete from Docente where cedula = ?', [cedula]);
    var email =
        conn.query('select email from Persona where cedula = ?', [cedula]);
    conn.query('delete from Persona where cedula = ?', [cedula]);
    conn.query('delete from Usuario where email = ?', [email]);
  }

  Future<void> assignDocente(String cedulaDocente, String idCurso) async {
    var conn = await getConnection();
    conn.query('update Curso set cedulaDocente = ? where ID_Curso = ?',
        [cedulaDocente, idCurso]);
  }

  Future<void> withdrawDocente(String cedulaDocente, String idCurso) async {
    var conn = await getConnection();
    conn.query(
        'update Curso set cedulaDocente = Null where ID_Curso = ? AND cedulaDocente = ?',
        [idCurso, cedulaDocente]);
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

  Future<void> setDocente(String cedula, String nombre, String primerApellido,
      String segundoApellido, String email) async {
    var conn = await getConnection();
    conn.query(
        'update Docente set nombre = ?, primerApellido = ?, segundoApellido = ?, email = ? where cedula = ?;',
        [nombre, primerApellido, segundoApellido, email, cedula]);
    conn.query(
        'update Persona set nombre = ?, primerApellido = ?, segundoApellido = ? where cedula = ?;',
        [nombre, primerApellido, segundoApellido, cedula]);
  }

  //Estudiante
  Future<void> addEstudiante(
      String cedula,
      String nombre,
      String primerApellido,
      String segundoApellido,
      String grado,
      String email,
      String contrasena) async {
    var conn = await getConnection();
    conn.query('insert into Usuario (email, contrasena, rol) values (?, ?, ?)',
        [email, contrasena, "Docente"]);
    conn.query(
        'insert into Persona (cedula, nombre, primerApellido, segundoApellido, email) values (?, ?, ?, ?, ?)',
        [cedula, nombre, primerApellido, segundoApellido, email]);
    conn.query(
        'insert into Estudiante (cedula, nombre, primerApellido, segundoApellido, grado, email) values (?, ?, ?, ?, ?, ?)',
        [cedula, nombre, primerApellido, segundoApellido, grado, email]);
  }

  Future<void> removeEstudiante(String cedula) async {
    var conn = await getConnection();
    conn.query('delete from Estudiante where cedula = ?', [cedula]);
    var email =
        conn.query('select email from Persona where cedula = ?', [cedula]);
    conn.query('delete from Persona where cedula = ?', [cedula]);
    conn.query('delete from Usuario where email = ?', [email]);
  }

  Future<void> assignEstudiante(String cedulaEstudiante, String idCurso) async {
    var conn = await getConnection();
    conn.query(
        'insert into EstudiantePorCurso (ID_Curso, cedulaEstudiante) values (?, ?)',
        [idCurso, cedulaEstudiante]);
  }

  Future<void> withdrawEstudiante(
      String cedulaEstudiante, String idCurso) async {
    var conn = await getConnection();
    conn.query(
        'delete from EstudiantePorCurso where cedulaEstudiante = ? AND ID_Curso = ?',
        [cedulaEstudiante, idCurso]);
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

  Future<void> setEstudiantes(
      String cedula,
      String nombre,
      String primerApellido,
      String segundoApellido,
      String grado,
      String email) async {
    var conn = await getConnection();
    conn.query(
        'update Estudiante set nombre = ?, primerApellido = ?, segundoApellido = ?, gradoEscolar = ?, email = ? where cedula = ?;',
        [nombre, primerApellido, segundoApellido, email, grado, cedula]);
    conn.query(
        'update Persona set nombre = ?, primerApellido = ?, segundoApellido = ? where cedula = ?;',
        [nombre, primerApellido, segundoApellido, cedula]);
  }

  //Cursos
  Future<void> addCurso(
      String nombre, String grado, List<String> horario) async {
    var conn = await getConnection();
    var idCurso = conn.query(
        'insert into Curso (nombre, gradoEscolar) values (?, ?); SELECT LAST_INSERT_ID()',
        [nombre, grado]);
    horario.forEach((tiempo) {
      var partes = tiempo.split(" ");
      conn.query(
          'insert into CursoPorDia (ID_Curso, dia, horaInicio, horaFin) values (?, ?, ?, ?)',
          [idCurso, partes[1], partes[2], partes[3]]);
    });
  }

  Future<void> removeCurso(int idCurso) async {
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
      int idCurso, String nombre, String grado, List<String> horario) async {
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

  //Mensajes
  Future<void> addMensaje(String contenido, String fechaEnvio, String idCurso,
      String emisor) async {
    var conn = await getConnection();
    conn.query(
        'insert into Mensaje (contenido, fechaEnvio, idCurso, emisor) values (?, ?, ?, ?)',
        [contenido, fechaEnvio, idCurso, emisor]);
  }

  Future<List<Mensaje>> getAllMensajes(String idCurso) async {
    List<Mensaje> mensajes = [];
    var conn = await getConnection();
    var results = await conn
        .query('select * from Mensajes where ID_Curso = ?', [idCurso]);
    for (var row in results) {
      mensajes.add(Mensaje(row[0], row[1], row[2], row[3], row[4]));
    }
    return mensajes;
  }

  //Noticias
  Future<void> addNoticia(String mensaje, String idCurso) async {
    var conn = await getConnection();
    conn.query('insert into Noticia (mensaje, ID_Curso) values (?, ?)',
        [mensaje, idCurso]);
  }

  Future<void> removeNoticia(String idNoticia) async {
    var conn = await getConnection();
    conn.query('delete from Noticia where ID_Noticia = ?', [idNoticia]);
  }

  Future<Noticia> getNoticia(String idNoticia) async {
    var conn = await getConnection();
    var results = await conn
        .query('select * from Noticia where ID_Noticia = ?', [idNoticia]);
    return Noticia(results.first[0], results.first[1], results.first[2]);
  }

  Future<List<Noticia>> getAllNoticias(String idCurso) async {
    List<Noticia> noticias = [];
    var conn = await getConnection();
    var results =
        await conn.query('select * from Noticia where ID_Curso = ?', [idCurso]);
    for (var row in results) {
      noticias.add(Noticia(row[0], row[1], row[2]));
    }
    return noticias;
  }

  Future<void> setNoticia(String idNoticia, String mensaje) async {
    var conn = await getConnection();
    conn.query('update Noticia set mensaje = ? where ID_Noticia = ?',
        [mensaje, idNoticia]);
  }

  //Tareas
  Future<void> addTarea(String descripcion, String fechaEntrega, String idCurso,
      String titulo) async {
    var conn = await getConnection();
    conn.query(
        'insert into Tarea (descripcion, fechaEntrega, ID_Curso, titulo) values (?, ?, ?, ?)',
        [descripcion, fechaEntrega, idCurso, titulo]);
  }

  Future<void> removeTarea(String idTarea) async {
    var conn = await getConnection();
    conn.query('delete from Tarea where ID_Tarea = ?', [idTarea]);
  }

  Future<Tarea> getTarea(String idTarea) async {
    var conn = await getConnection();
    var results =
        await conn.query('select * from Tarea where ID_Tarea = ?', [idTarea]);
    return Tarea(results.first[0], results.first[1], results.first[2],
        results.first[3], results.first[4]);
  }

  Future<List<Tarea>> getAllTareas(String idCurso) async {
    List<Tarea> tareas = [];
    var conn = await getConnection();
    var results =
        await conn.query('select * from Tarea where ID_Curso = ?', [idCurso]);
    for (var row in results) {
      tareas.add(Tarea(row[0], row[1], row[2], row[3], row[4]));
    }
    return tareas;
  }

  Future<void> setTarea(String idTarea, String descripcion, String fechaEntrega,
      String titulo) async {
    var conn = await getConnection();
    conn.query(
        'update Tarea set descripcion = ?, fechaEntrega = ?, titulo = ? where ID_Tarea = ?',
        [descripcion, fechaEntrega, titulo, idTarea]);
  }

  Future<String> getDocenteDelCurso(int idCurso) async {
    var conn = await getConnection();
    var results = await conn.query(
        'select Docente.cedula, Docente.nombre, Docente.primerApellido, Docente.segundoApellido FROM Curso INNER JOIN Docente ON Curso.cedulaDocente = Docente.cedula WHERE Curso.ID_Curso = ?',
        [idCurso]);
    return results.first[0] +
        " - " +
        results.first[1] +
        " " +
        results.first[2] +
        " " +
        results.first[3];
  }

  Future<List<String>> getEstudiantesDelCurso(int idCurso) async {
    List<String> estudiantes = [];
    var conn = await getConnection();
    var results = await conn.query(
        'SELECT Estudiante.cedula, Estudiante.nombre, Estudiante.primerApellido, Estudiante.segundoApellido FROM Curso INNER JOIN EstudiantePorCurso ON Curso.ID_Curso = EstudiantePorCurso.ID_Curso INNER JOIN Estudiante ON EstudiantePorCurso.cedulaEstudiante = Estudiante.cedula WHERE Curso.ID_Curso = ?',
        [idCurso]);
    for (var e in results) {
      estudiantes.add(e[0] + " - " + e[1] + " " + e[2] + " " + e[3] + " ");
    }
    return estudiantes;
  }

  Future<List<String>> getCursosProfesor(String cedula) async {
    List<String> cursos = [];
    var conn = await getConnection();
    var results = await conn.query(
        'SELECT Curso.ID_Curso, Curso.nombre FROM Curso INNER JOIN Docente ON Curso.cedulaDocente = Docente.cedula WHERE Curso.cedulaDocente = ?',
        [cedula]);
    for (var c in results) {
      cursos.add(c[0].toString() + " - " + c[1]);
    }
    return cursos;
  }

  Future<String> getCedula(String email) async {
    var conn = await getConnection();
    var results = await conn.query(
        'SELECT Docente.cedula FROM Docente INNER JOIN Usuario ON Docente.email = Usuario.email WHERE Docente.email = ?',
        [email]);
    if (results.isEmpty) {
      results = await conn.query(
          'SELECT Estudiante.cedula FROM Estudiante INNER JOIN Usuario ON Estudiante.email = Usuario.email WHERE Estudiante.email = ?',
          [email]);
    }
    return results.first[0];
  }

  Future<List<String>> getCursosEstudiante(String cedula) async {
    List<String> cursos = [];
    var conn = await getConnection();
    var results = await conn.query(
        'SELECT Curso.ID_Curso, Curso.nombre FROM Curso INNER JOIN EstudiantePorCurso ON Curso.ID_Curso = EstudiantePorCurso.ID_Curso INNER JOIN Estudiante ON EstudiantePorCurso.cedulaEstudiante = Estudiante.cedula where Estudiante.cedula = ?',
        [cedula]);
    for (var c in results) {
      cursos.add(c[0].toString() + " - " + c[1]);
    }
    return cursos;}
}
