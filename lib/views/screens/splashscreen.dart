import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/views/screens/adminpage.dart';
import 'package:flutter_attendance_app/views/screens/facultypage.dart';
import 'package:flutter_attendance_app/views/screens/studentpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import '../../controller/google_ad_controller.dart';
import '../../controller/local_notification_controller.dart';
import '../../res/global.dart';
import 'intro_1.dart';
import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    LocalPushNotificationHelper.localPushNotificationHelper
        .initializeLocalPushNotification();
    Timer(
      const Duration(seconds: 6),
          () => Get.off(
            () => (Global.isVisited == false)
            ? const IntroScreen1()
            : (Global.isLogged == false)
            ? const LoginScreen()
            : (Global.emailCheck=='admin@gmail.com')?const AdminPage():(Global.emailCheck=="faculty@gmail.com")?const FacultyPage():const StudentPage(),
        curve: Curves.easeInOut,
        transition: Transition.cupertino,
      ),
    );
    AdHelper.adHelper.loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xfff25b24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.png',
              filterQuality: FilterQuality.high,
              scale: 0.8,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Attendance app",
                  curve: Curves.easeInOut,
                  cursor: '',
                  speed: const Duration(milliseconds: 300),
                  textStyle: GoogleFonts.arya(
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
