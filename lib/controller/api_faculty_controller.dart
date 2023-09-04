import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_faculty_model.dart';

class ApiFacultyHelper {
  ApiFacultyHelper._();

  static final ApiFacultyHelper apiFacultyHelper = ApiFacultyHelper._();

  Future<List?> fetchAllFaculties() async {
    http.Response res = await http.get(
        Uri.parse("localhost/attendance_app/api/api_fetch_all_faculty.php"));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      List allFaculties = decodedData['data'];

      return allFaculties;
    }
    return null;
  }

  Future insertFaculty({required FacultyModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_insert_faculty.php"),
      body: {
        'stream_id': data.streamId,
        'name': data.name,
        'email': data.email,
        'role': data.role,
        'subject': data.subject,
      },
    );
  }

  Future fetchSingleFaculty({required FacultyModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_fetch_single_faculty.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future deleteFaculty({required FacultyModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_delete_faculty.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future updateFaculty({required FacultyModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_update_faculty.php"),
      body: {
        'stream_id': data.streamId,
        'name': data.name,
        'email': data.email,
        'role': data.role,
        'subject': data.subject,
        'id': data.id,
      },
    );
  }
}
