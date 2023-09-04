class FacultyModel {
  int? id;
  int streamId;
  String name;
  String email;
  String role;
  String subject;

  FacultyModel({
    this.id,
    required this.streamId,
    required this.name,
    required this.email,
    required this.role,
    required this.subject,
  });

  factory FacultyModel.fromMap({required Map data}) {
    return FacultyModel(
      id: data['id'],
      streamId: data['stream_id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
      subject: data['subject'],
    );
  }
}
