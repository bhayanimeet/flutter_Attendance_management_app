class StudentsAttendanceModel {
  int? id;
  String attendance;

  StudentsAttendanceModel({
    this.id,
    required this.attendance,
  });

  factory StudentsAttendanceModel.fromMap({required Map data}) {
    return StudentsAttendanceModel(
      id: data['id'],
      attendance: data['attendance'],
    );
  }
}
