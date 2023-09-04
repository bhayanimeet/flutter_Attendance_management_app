class ClassModel {
  int? id;
  int streamId;
  String name;
  String subject;
  String startTime;
  String endTime;
  String classNo;
  String description;

  ClassModel({
    this.id,
    required this.streamId,
    required this.name,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.classNo,
    required this.description,
  });

  factory ClassModel.fromMap({required Map data}) {
    return ClassModel(
      id: data['id'],
      streamId: data['stream_id'],
      name: data['name'],
      subject: data['subject'],
      startTime: data['start_time'],
      endTime: data['end_time'],
      classNo: data['class_no'],
      description: data['description'],
    );
  }
}
