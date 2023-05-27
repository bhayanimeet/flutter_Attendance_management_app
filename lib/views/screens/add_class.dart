import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/controller/sqlite_db_controller_for_class.dart';
import 'package:flutter_attendance_app/models/class_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../res/global.dart';
import 'adminpage.dart';
import 'facultypage.dart';

class AddClass extends StatefulWidget {
  const AddClass({Key? key}) : super(key: key);

  @override
  State<AddClass> createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {

  GlobalKey<FormState> insertKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            toolbarHeight: 80,
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(25)),
                color: (Global.isDark == true)
                    ? const Color(0xff35313f)
                    : const Color(0xffe9e2f1),
              ),
              child: FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: Align(
                  alignment: const Alignment(-0.89, -0.4),
                  child: Text(
                    "Faculty",
                    style: GoogleFonts.arya(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color:
                      Global.isDark == true ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Expanded(
                      flex: 11,
                      child: SizedBox(
                        height: 50,
                        width: 200,
                        child: Text(
                          "Add Faculty",
                          style: GoogleFonts.arya(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Global.isDark == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                titlePadding: const EdgeInsets.only(left: 20, bottom: 10),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Form(
                key: insertKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12,right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Text("Write Faculty's name",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.facultyController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.faculty = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter faculty name first...';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          hintText: 'Enter faculty name',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Name',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text("Write Subject name",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.subController,
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.sub = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter subject name first...';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          hintText: 'Enter subject name',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Subject',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text("Write Starting time of class",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.startTimeController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (time != null) {
                            setState(() {
                              Global.startTimeController.text = time.format(context);
                            });
                          }
                        },
                        readOnly: true,
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.startTime = Global.startTimeController.text;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please select time...";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          hintText: "Select time",
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: "Time",
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text("Write ending time of class",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.endTimeController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () async {
                          TimeOfDay? time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );

                          if (time != null) {
                            setState(() {
                              Global.endTimeController.text = time.format(context);
                            });
                          }
                        },
                        readOnly: true,
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.endTime = Global.endTimeController.text;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please select time...";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          hintText: "Select time",
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: "Time",
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text("Write class room number",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.classRoomController,
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.classRoom = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter class room number first...';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          hintText: 'Enter Class room',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Classroom',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text("Write extra description",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.desController,
                        keyboardType: TextInputType.emailAddress,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.des = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter description first...';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: (Get.isDarkMode == true)
                                      ? Colors.white
                                      : Colors.black,
                                  width: 1)),
                          hintText: 'Enter extra details',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Details',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (insertKey.currentState!.validate()) {
            insertKey.currentState!.save();
            ClassModel s1 = ClassModel(
              classRoom: Global.classRoom!,
              startTime: Global.startTime!,
              endTime: Global.endTime!,
              subject: Global.sub!,
              faculty: Global.faculty!,
              description: Global.des!,
            );

            int res = await ClassHelper.classHelper.insertData(data: s1);

            if (res > 0) {
              setState(() {
                Global.allClasses = ClassHelper.classHelper.selectData();
              });
            }

            Get.off(
              (Global.emailCheck=='admin@gmail.com')?() => const AdminPage():const FacultyPage(),
              curve: Curves.easeInOut,
              transition: Transition.fadeIn,
              duration: const Duration(seconds: 1),
            );

            Get.showSnackbar(
              GetSnackBar(
                title: 'Class',
                backgroundColor: Colors.indigo.shade300,
                snackPosition: SnackPosition.BOTTOM,
                borderRadius: 20,
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.all(15),
                message: "Class Scheduled...",
                snackStyle: SnackStyle.FLOATING,
              ),
            );

            setState(() {
              Global.classRoomController.clear();
              Global.startTimeController.clear();
              Global.endTimeController.clear();
              Global.subController.clear();
              Global.facultyController.clear();
              Global.desController.clear();
              Global.classRoom = null;
              Global.startTime = null;
              Global.endTime = null;
              Global.sub = null;
              Global.faculty = null;
              Global.des = null;
            });
          }
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
