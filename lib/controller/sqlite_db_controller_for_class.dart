import 'package:flutter_attendance_app/models/class_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ClassHelper {
  ClassHelper._();
  static final ClassHelper classHelper =  ClassHelper._();

  Database? db;

  static const tableName = "Class";
  static const id = "id";
  static const classRoom = "classRoom";
  static const startTime = "startTime";
  static const endTime = "endTime";
  static const subject = "subject";
  static const faculty = "faculty";
  static const description = "description";

  Future<void> dataTable() async {
    String directory = await getDatabasesPath();
    String path = join(directory, "class.db");

    db = await openDatabase(
      path,
      version: 3,
      onCreate: (Database db, int version) async {
        String query = "CREATE TABLE IF NOT EXISTS $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT,$classRoom TEXT,$startTime TEXT,$endTime TEXT,$subject TEXT,$faculty TEXT,$description TEXT)";
        await db.execute(query);
      },
    );
  }

  Future<int> insertData({required ClassModel data}) async {
    await dataTable();

    String query = "INSERT INTO $tableName($classRoom,$startTime,$endTime,$subject,$faculty,$description) VALUES(?,?,?,?,?,?)";
    List args = [data.classRoom,data.startTime,data.endTime,data.subject,data.faculty,data.description];

    int res = await db!.rawInsert(query, args);

    return res;
  }

  Future<List<ClassModel>> selectData() async {
    await dataTable();

    String query = "SELECT * FROM $tableName;";

    List<Map<String,dynamic>> classes = await db!.rawQuery(query);

    List<ClassModel> studentClass = classes.map((e) => ClassModel.fromMap(data: e)).toList();

    return studentClass;
  }

  Future<int> deleteData({required int index}) async {
    await dataTable();

    String query = "DELETE FROM $tableName WHERE $id=?;";

    int res = await db!.rawDelete(query, [index]);

    return res;
  }
}