class FacultyModel {
  int? id;
  final String name;
  final String email;
  final String role;
  final String subject;

  FacultyModel({
    this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.subject,
  });

  factory FacultyModel.fromMap({required Map<String,dynamic> data}){
    return FacultyModel(
      id: data['id'],
      name: data['name'],
      email: data['email'],
      role: data['role'],
      subject: data['subject'],
    );
  }
}
