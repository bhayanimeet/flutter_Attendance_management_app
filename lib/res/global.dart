import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/models/class_model.dart';
import 'package:flutter_attendance_app/models/faculty_model.dart';
import 'package:flutter_attendance_app/models/notice_model.dart';

class Global{
  static bool isDark = true;
  static bool isVisited = false;
  static bool isLogged = false;
  static String? emailCheck;

  static String? notice;
  static TextEditingController noticeController = TextEditingController();
  static String? description;
  static TextEditingController descriptionController = TextEditingController();
  static String? time;
  static TextEditingController timeController = TextEditingController();
  static late Future<List<NoticeModel>> allNotices;
  static late List<NoticeModel> notices;

  static String? name;
  static TextEditingController nameController = TextEditingController();
  static String? email;
  static TextEditingController emailController = TextEditingController();
  static String? role;
  static TextEditingController roleController = TextEditingController();
  static String? subject;
  static TextEditingController subjectController = TextEditingController();
  static late Future<List<FacultyModel>> allFaculties;
  static late List<FacultyModel> faculties;

  static String? classRoom;
  static TextEditingController classRoomController = TextEditingController();
  static String? startTime;
  static TextEditingController startTimeController = TextEditingController();
  static String? endTime;
  static TextEditingController endTimeController = TextEditingController();
  static String? sub;
  static TextEditingController subController = TextEditingController();
  static String? faculty;
  static TextEditingController facultyController = TextEditingController();
  static String? des;
  static TextEditingController desController = TextEditingController();
  static late Future<List<ClassModel>> allClasses;
  static late List<ClassModel> classes;
}