import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/views/screens/all_classes.dart';
import 'package:flutter_attendance_app/views/screens/all_notices.dart';
import 'package:flutter_attendance_app/views/screens/faculty_detail.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/firebase_login_controller.dart';
import '../../res/global.dart';
import 'loginscreen.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
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
                  alignment: const Alignment(-0.86, -0.4),
                  child: Text(
                    "Student",
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
                          "Dashboard",
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
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          Get.changeThemeMode(
                            (Get.isDarkMode == true)
                                ? ThemeMode.light
                                : ThemeMode.dark,
                          );
                          setState(() {
                            Global.isDark = !Global.isDark;
                          });
                        },
                        child: const Icon(Icons.light_mode_outlined),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: (){
                          Get.to(
                                () => const AllNotices(),
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          title: 'All notices',
                          image: 'assets/images/add_notice.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: (){
                          Get.to(
                              () => const AllClasses(),
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          title: 'All Class',
                          image: 'assets/images/class.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: (){
                          Get.to(
                                () => const DetailOfFaculties(),
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          title: 'All Faculty',
                          image: 'assets/images/add_faculty.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                      myContainer(
                        title: 'Your attendance',
                        image: 'assets/images/attendance.png',
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          await FirebaseHelper.firebaseHelper.signOut();
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isLogged', false);
                          Get.off(
                                () => const LoginScreen(),
                            duration: const Duration(seconds: 2),
                            curve: Curves.easeInOut,
                            transition: Transition.fadeIn,
                          );
                        },
                        child: myContainer(
                          title: 'Sign out',
                          image: 'assets/images/logout.png',
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget myContainer({required String title, required String image}) {
    return Neumorphic(
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        surfaceIntensity: 0.9,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(15),
        ),
        depth: 1,
        lightSource: LightSource.topLeft,
        oppositeShadowLightSource: false,
        shadowLightColor:
        (Global.isDark == false) ? Colors.grey.shade300 : Colors.white54,
        color: (Global.isDark == false) ? Colors.white : Colors.black12,
      ),
      child: Container(
        height: 150,
        width: double.infinity,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 5,right: 5),
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.arya(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
                color: Global.isDark==true?Colors.white54:Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
