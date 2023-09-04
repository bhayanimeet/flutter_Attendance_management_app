import 'dart:convert';
import 'package:flutter_attendance_app/models/api_student_attendance_model.dart';
import 'package:http/http.dart' as http;

class ApiStudentAttendanceHelper {
  ApiStudentAttendanceHelper._();

  static final ApiStudentAttendanceHelper apiStudentAttendanceHelper = ApiStudentAttendanceHelper._();

  Future<List?> fetchAllStudentsAttendance() async {
    http.Response res = await http.get(
        Uri.parse("localhost/attendance_app/api/api_fetch_all_students_attendance.php"));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      List allStudentsAttendance = decodedData['data'];

      return allStudentsAttendance;
    }
    return null;
  }

  Future insertStudentsAttendance({required StudentsAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_insert_Student_attendance.php"),
      body: {
        'attendance': data.attendance,
      },
    );
  }

  Future fetchSingleStudentAttendance({required StudentsAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_fetch_single_Student_attendance.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future deleteStudentAttendance({required StudentsAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_delete_Student_attendance.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future updateStudentsAttendance({required StudentsAttendanceModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_update_Student_attendance.php"),
      body: {
        'attendance': data.attendance,
        'id': data.id,
      },
    );
  }
}
