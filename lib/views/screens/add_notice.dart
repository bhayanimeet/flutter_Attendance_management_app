import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/models/notice_model.dart';
import 'package:flutter_attendance_app/views/screens/adminpage.dart';
import 'package:flutter_attendance_app/views/screens/facultypage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../controller/local_notification_controller.dart';
import '../../controller/sqlite_db_controller_for_notice.dart';
import '../../res/global.dart';

class AddNotice extends StatefulWidget {
  const AddNotice({Key? key}) : super(key: key);

  @override
  State<AddNotice> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNotice> {

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
                    "Notice",
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
                          "Add Notice",
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
                      const SizedBox(height: 40),
                      Text("Write Notice",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.noticeController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.notice = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter your notice title first...';
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
                          hintText: 'Enter your notice title',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Notice',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text("Write Description",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.descriptionController,
                        style: GoogleFonts.play(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.description = val!;
                          });
                        },
                        validator: (val) {
                          if (val!.isEmpty) {
                            return 'Enter your notice description first...';
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
                          hintText: 'Enter your notice in detail',
                          hintStyle: GoogleFonts.play(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                          labelText: 'Description',
                          labelStyle: GoogleFonts.arya(
                              fontSize: 25, fontWeight: FontWeight.w500),
                          errorStyle: GoogleFonts.play(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text("Select Time",style: GoogleFonts.arya(fontSize: 23,fontWeight: FontWeight.w500),),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: Global.timeController,
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
                              Global.timeController.text = time.format(context);
                            });
                          }
                        },
                        readOnly: true,
                        enableSuggestions: true,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {
                          setState(() {
                            Global.time = Global.timeController.text;
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
            NoticeModel s1 = NoticeModel(
              notice: Global.notice!,
              description: Global.description!,
              time: Global.time!,
            );

            int res = await NoticeHelper.noticeHelper.insertData(data: s1);

            if (res > 0) {
              setState(() {
                Global.allNotices = NoticeHelper.noticeHelper.selectData();
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
                title: 'Notice',
                backgroundColor: Colors.indigo.shade300,
                snackPosition: SnackPosition.BOTTOM,
                borderRadius: 20,
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.all(15),
                message: 'Notice send successfully...',
                snackStyle: SnackStyle.FLOATING,
              ),
            );

            await LocalPushNotificationHelper.localPushNotificationHelper.showSimpleNotificationForAddNotice();

            setState(() {
              Global.noticeController.clear();
              Global.descriptionController.clear();
              Global.timeController.clear();
              Global.notice = null;
              Global.description = null;
              Global.time = null;
            });
          }
        },
        label: const Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
