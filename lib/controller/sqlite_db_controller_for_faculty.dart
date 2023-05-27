import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/faculty_model.dart';

class FacultyHelper {
  FacultyHelper._();
  static final FacultyHelper facultyHelper =  FacultyHelper._();

  Database? db;

  static const tableName = "Faculty";
  static const id = "id";
  static const name = "name";
  static const email = "email";
  static const role = "role";
  static const subject = "subject";

  Future<void> dataTable() async {
    String directory = await getDatabasesPath();
    String path = join(directory, "faculty.db");

    db = await openDatabase(
      path,
      version: 2,
      onCreate: (Database db, int version) async {
        String query = "CREATE TABLE IF NOT EXISTS $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT,$name TEXT,$email TEXT,$role TEXT,$subject TEXT)";
        await db.execute(query);
      },
    );
  }

  Future<int> insertData({required FacultyModel data}) async {
    await dataTable();

    String query = "INSERT INTO $tableName($name,$email,$role,$subject) VALUES(?,?,?,?)";
    List args = [data.name,data.email,data.role,data.subject];

    int res = await db!.rawInsert(query, args);

    return res;
  }

  Future<int> update({required FacultyModel data,required int index}) async {
    await dataTable();

    String query = "UPDATE $tableName SET $name =?,$email =?,$role =?,$subject=? WHERE $id=?;";

    List args = [data.name,data.email,data.role,data.subject,index];

    int res = await db!.rawUpdate(query,args);

    return res;
  }

  Future<List<FacultyModel>> selectData() async {
    await dataTable();

    String query = "SELECT * FROM $tableName;";

    List<Map<String,dynamic>> faculties = await db!.rawQuery(query);

    List<FacultyModel> faculty = faculties.map((e) => FacultyModel.fromMap(data: e)).toList();

    return faculty;
  }

  Future<int> deleteData({required int index}) async {
    await dataTable();

    String query = "DELETE FROM $tableName WHERE $id=?;";

    int res = await db!.rawDelete(query, [index]);

    return res;
  }
}