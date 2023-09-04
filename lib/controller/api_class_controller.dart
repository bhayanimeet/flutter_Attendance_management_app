import 'dart:convert';
import 'package:flutter_attendance_app/models/api_class_model.dart';
import 'package:http/http.dart' as http;

class ApiClassHelper {
  ApiClassHelper._();

  static final ApiClassHelper apiClassHelper = ApiClassHelper._();

  Future<List?> fetchAllClasses() async {
    http.Response res = await http.get(
        Uri.parse("localhost/attendance_app/api/api_fetch_all_class.php"));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      List allClasses = decodedData['data'];

      return allClasses;
    }
    return null;
  }

  Future insertClass({required ClassModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_insert_class.php"),
      body: {
        'stream_id': data.streamId,
        'name': data.name,
        'subject': data.subject,
        'start_time': data.startTime,
        'end_time': data.endTime,
        'class_no': data.classNo,
        'description': data.description,
      },
    );
  }

  Future fetchSingleClass({required ClassModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_fetch_single_class.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future deleteClass({required ClassModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_delete_class.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future updateClass({required ClassModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_update_class.php"),
      body: {
        'stream_id': data.streamId,
        'name': data.name,
        'subject': data.subject,
        'start_time': data.startTime,
        'end_time': data.endTime,
        'class_no': data.classNo,
        'description': data.description,
        'id': data.id,
      },
    );
  }
}
