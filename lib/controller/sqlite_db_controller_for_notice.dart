import 'package:flutter_attendance_app/models/notice_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoticeHelper {
  NoticeHelper._();
  static final NoticeHelper noticeHelper =  NoticeHelper._();

  Database? db;

  static const tableName = "Notice";
  static const id = "id";
  static const notice = "notice";
  static const description = "description";
  static const time = "time";

  Future<void> dataTable() async {
    String directory = await getDatabasesPath();
    String path = join(directory, "notice.db");

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        String query = "CREATE TABLE IF NOT EXISTS $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT,$notice TEXT,$description TEXT,$time TEXT)";
        await db.execute(query);
      },
    );
  }

  Future<int> insertData({required NoticeModel data}) async {
    await dataTable();

    String query = "INSERT INTO $tableName($notice,$description,$time) VALUES(?,?,?)";
    List args = [data.notice,data.description,data.time];

    int res = await db!.rawInsert(query, args);

    return res;
  }

  Future<List<NoticeModel>> selectData() async {
    await dataTable();

    String query = "SELECT * FROM $tableName;";

    List<Map<String,dynamic>> notices = await db!.rawQuery(query);

    List<NoticeModel> notice = notices.map((e) => NoticeModel.fromMap(data: e)).toList();

    return notice;
  }

  Future<int> deleteData({required int index}) async {
    await dataTable();

    String query = "DELETE FROM $tableName WHERE $id=?;";

    int res = await db!.rawDelete(query, [index]);

    return res;
  }
}