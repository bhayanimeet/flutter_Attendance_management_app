import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/controller/sqlite_db_controller_for_notice.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../res/global.dart';

class DeleteNotice extends StatefulWidget {
  const DeleteNotice({Key? key}) : super(key: key);

  @override
  State<DeleteNotice> createState() => _DeleteNoticeState();
}

class _DeleteNoticeState extends State<DeleteNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: NoticeHelper.noticeHelper.selectData(),
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
            Global.notices = snapshot.data!;
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
                                "Notice",
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
                  child: (Global.notices.isNotEmpty)
                      ? ListView.builder(
                          itemCount: Global.notices.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding:
                              const EdgeInsets.only(left: 5, right: 5, top: 8),
                          itemBuilder: (context, i) => Card(
                            elevation: 3,
                            child: Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "🔔 Notice from Principal",
                                          style: GoogleFonts.lato(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            int res = await NoticeHelper
                                                .noticeHelper
                                                .deleteData(
                                                    index: Global
                                                        .notices[i].id!);

                                            if (res == 1) {
                                              setState(() {
                                                Global.allNotices =
                                                    NoticeHelper
                                                        .noticeHelper
                                                        .selectData();
                                              });
                                            }
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      Global.notices[i].time,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.arya(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      width: MediaQuery.of(context)
                                              .size
                                              .width /
                                          1.2,
                                      child: Divider(
                                        thickness: 1,
                                        color: Global.isDark == true
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      Global.notices[i].notice,
                                      style: GoogleFonts.lato(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: 115,
                                      width: MediaQuery.of(context).size.width /1.2,
                                      child: Text(
                                        Global.notices[i].description,
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Column(
                        children: [
                          const SizedBox(height: 300),
                          Text(
                            "Your notice list empty...",
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
