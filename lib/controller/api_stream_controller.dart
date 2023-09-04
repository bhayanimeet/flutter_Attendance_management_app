import 'dart:convert';
import 'package:flutter_attendance_app/models/api_stream_model.dart';
import 'package:http/http.dart' as http;

class ApiStreamHelper {
  ApiStreamHelper._();

  static final ApiStreamHelper apiStreamHelper = ApiStreamHelper._();

  Future<List?> fetchAllStream() async {
    http.Response res = await http.get(
        Uri.parse("localhost/attendance_app/api/api_fetch_all_stream.php"));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      List allStreams = decodedData['data'];

      return allStreams;
    }
    return null;
  }

  Future insertStream({required StreamModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_insert_stream.php"),
      body: {
        'stream': data.stream,
      },
    );
  }

  Future fetchSingleStream({required StreamModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_fetch_single_stream.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future deleteStream({required StreamModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_delete_stream.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future updateStream({required StreamModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_update_stream.php"),
      body: {
        'stream' : data.stream,
        'id' : data.id,
      },
    );
  }
}
