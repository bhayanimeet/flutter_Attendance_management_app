class FacultiesAttendanceModel {
  int? id;
  String attendance;

  FacultiesAttendanceModel({
    this.id,
    required this.attendance,
  });

  factory FacultiesAttendanceModel.fromMap({required Map data}) {
    return FacultiesAttendanceModel(
      id: data['id'],
      attendance: data['attendance'],
    );
  }
}
