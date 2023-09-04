class NoticeModel {
  int? id;
  int streamId;
  String notice;
  String description;
  String time;

  NoticeModel({
    this.id,
    required this.streamId,
    required this.notice,
    required this.description,
    required this.time,
  });

  factory NoticeModel.fromMap({required Map data}) {
    return NoticeModel(
      id: data['id'],
      streamId: data['stream_id'],
      notice: data['notice'],
      description: data['description'],
      time: data['time'],
    );
  }
}
