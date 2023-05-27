class NoticeModel {
  int? id;
  final String notice;
  final String description;
  final String time;

  NoticeModel({
    this.id,
    required this.notice,
    required this.description,
    required this.time,
  });

  factory NoticeModel.fromMap({required Map<String,dynamic> data}){
    return NoticeModel(
      id: data['id'],
      notice: data['notice'],
      description: data['description'],
      time: data['time'],
    );
  }
}
