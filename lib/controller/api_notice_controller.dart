import 'dart:convert';
import 'package:flutter_attendance_app/models/apI_notice_model.dart';
import 'package:http/http.dart' as http;

class ApiNoticeHelper {
  ApiNoticeHelper._();

  static final ApiNoticeHelper apiNoticeHelper = ApiNoticeHelper._();

  Future<List?> fetchAllNotice() async {
    http.Response res = await http.get(
        Uri.parse("localhost/attendance_app/api/api_fetch_all_notice.php"));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      List allNotices = decodedData['data'];

      return allNotices;
    }
    return null;
  }

  Future insertNotice({required NoticeModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_insert_notice.php"),
      body: {
        'stream_id': data.streamId,
        'notice': data.notice,
        'description': data.description,
        'time': data.time,
      },
    );
  }

  Future fetchSingleNotice({required NoticeModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_fetch_single_notice.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future deleteNotice({required NoticeModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_delete_notice.php"),
      body: {
        'id' : data.id,
      },
    );
  }

  Future updateNotice({required NoticeModel data}) async {
    await http.post(
      Uri.parse("localhost/attendance_app/api/api_update_notice.php"),
      body: {
        'stream_id': data.streamId,
        'notice': data.notice,
        'description': data.description,
        'time': data.time,
        'id': data.id,
      },
    );
  }
}
