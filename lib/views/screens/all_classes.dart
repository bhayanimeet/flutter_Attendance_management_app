import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/controller/sqlite_db_controller_for_class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../res/global.dart';

class AllClasses extends StatefulWidget {
  const AllClasses({Key? key}) : super(key: key);

  @override
  State<AllClasses> createState() => _AllClassesState();
}

class _AllClassesState extends State<AllClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ClassHelper.classHelper.selectData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Please wait...\n(Error from server)",
                textAlign: TextAlign.center,
                style: GoogleFonts.arya(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          } else if (snapshot.hasData) {
            Global.classes = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 120,
                  toolbarHeight: 80,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(25)),
                      color: (Global.isDark == true)
                          ? const Color(0xff35313f)
                          : const Color(0xffe9e2f1),
                    ),
                    child: FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      title: Row(
                        children: [
                          Expanded(
                            flex: 11,
                            child: SizedBox(
                              height: 50,
                              width: 200,
                              child: Text(
                                "Detail of all Classes",
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
                  child: (Global.classes.isNotEmpty)
                      ? ListView.builder(
                          itemCount: Global.classes.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 8),
                          itemBuilder: (context, i) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                "⌚ ${Global.classes[i].startTime} - ${Global.classes[i].endTime}",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.arya(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Card(
                                elevation: 3,
                                child: Container(
                                  height: 120,
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name : ${Global.classes[i].faculty}",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.arya(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24,
                                          ),
                                        ),
                                        Text(
                                          "Subject : ${Global.classes[i].subject}",
                                          style: GoogleFonts.playfairDisplay(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Classroom : ${Global.classes[i].classRoom}",
                                          style: GoogleFonts.play(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Extra : ${Global.classes[i].description}",
                                          style: GoogleFonts.play(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            const SizedBox(height: 300),
                            Text(
                              "Faculty detail not found...",
                              style: GoogleFonts.arya(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                ),
              ],
            );
          }
          return Center(
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.indigo,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}
