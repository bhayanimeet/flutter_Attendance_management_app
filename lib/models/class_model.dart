class ClassModel {
  int? id;
  final String classRoom;
  final String startTime;
  final String endTime;
  final String subject;
  final String faculty;
  final String description;

  ClassModel({
    this.id,
    required this.classRoom,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.faculty,
    required this.description,
  });

  factory ClassModel.fromMap({required Map<String,dynamic> data}){
    return ClassModel(
      id: data['id'],
      classRoom: data['classRoom'],
      startTime: data['startTime'],
      endTime: data['endTime'],
      subject: data['subject'],
      faculty: data['faculty'],
      description: data['description'],
    );
  }
}
