import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/models/faculty_model.dart';
import 'package:flutter_attendance_app/views/screens/adminpage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controller/sqlite_db_controller_for_faculty.dart';
import '../../res/global.dart';
import 'package:get/get.dart';

import 'facultypage.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    FacultyModel value = ModalRoute.of(context)!.settings.arguments as FacultyModel;

    Global.nameController.text = value.name;
    Global.emailController.text = value.email;
    Global.roleController.text = value.role;
    Global.subjectController.text = value.subject;

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
                  alignment: const Alignment(-0.88, -0.4),
                  child: Text(
                    "Update",
                    style: GoogleFonts.arya(
                      fontSize: 25,
                      fontWeight: FontWeight.w600, color:
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
                          "Update detail",
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
            child: Form(
              key: updateKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),
                      Text("Update Faculty's name",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: Global.nameController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.name = val!;
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
                      const SizedBox(height: 40),
                      Text("Update Faculty's email",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: Global.emailController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.email = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter faculty email first...';
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
                          hintText: 'Enter faculty email',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Email',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text("Update Faculty's Role",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: Global.roleController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.role = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter faculty role first...';
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
                          hintText: 'Enter faculty role',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Role',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text("Update Faculty's Subject",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: Global.subjectController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.subject = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter faculty subject first...';
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
                          hintText: 'Enter faculty subject',
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
                      const SizedBox(height: 40),
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
          if (updateKey.currentState!.validate()) {
            updateKey.currentState!.save();
            FacultyModel s1 = FacultyModel(
              name: Global.name!,
              email: Global.email!,
              role: Global.role!,
              subject: Global.subject!,
            );

            int res = await FacultyHelper.facultyHelper.update(index: value.id!,data: s1);

            if (res > 0) {
              setState(() {
                Global.allFaculties = FacultyHelper.facultyHelper.selectData();
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
                title: 'Update',
                backgroundColor: Colors.indigo.shade300,
                snackPosition: SnackPosition.BOTTOM,
                borderRadius: 20,
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.all(15),
                message: "Faculty's detail updated...",
                snackStyle: SnackStyle.FLOATING,
              ),
            );

            setState(() {
              Global.nameController.clear();
              Global.emailController.clear();
              Global.roleController.clear();
              Global.subjectController.clear();
              Global.name = null;
              Global.email = null;
              Global.role = null;
              Global.subject = null;
            });
          }
        },
        label: const Text('Update'),
        icon: const Icon(Icons.edit),
      ),
    );
  }
}
