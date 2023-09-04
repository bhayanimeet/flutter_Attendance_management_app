import 'dart:convert';
import 'package:flutter_attendance_app/models/api_faculty_attendance_model.dart';
import 'package:http/http.dart' as http;

class ApiFacultyAttendanceHelper {
  ApiFacultyAttendanceHelper._();

  static final ApiFacultyAttendanceHelper apiFacultyAttendanceHelper = ApiFacultyAttendanceHelper._();

  Future<List?> fetchAllFacultiesAttendance() async {
    http.Response res = await http.get(
        Uri.parse("localhost/attendance_app/api/api_fetch_all_faculty_attendance.php"));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      List allFacultiesAttendance = decodedData['data'];

      return allFacultiesAttendance;
    }
    return null;
  }

  Future insertFacultiesAttendance({required FacultiesAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_insert_faculty_attendance.php"),
      body: {
        'attendance': data.attendance,
      },
    );
  }

  Future fetchSingleFacultyAttendance({required FacultiesAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_fetch_single_faculty_attendance.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future deleteFacultyAttendance({required FacultiesAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_delete_faculty_attendance.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future updateFacultiesAttendance({required FacultiesAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_update_faculty_attendance.php"),
      body: {
        'attendance': data.attendance,
        'id': data.id,
      },
    );
  }
}
