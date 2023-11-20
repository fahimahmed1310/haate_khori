import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/dashboard_provider.dart';
import 'package:haate_khori_app/reusablewidgets/app_title_ui.dart';
import 'package:haate_khori_app/reusablewidgets/dashboard_pages_widgets/course_display_ui.dart';
import 'package:haate_khori_app/screens/drawer_screen.dart';
import 'package:provider/provider.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {




  @override
  Widget build(BuildContext context) {
    return  Consumer<DashBoardProvider>(
      builder: (_,dashBoardProvider,___){
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            toolbarHeight:MediaQuery.of(context).size.height * 0.08,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const AppTitleUi(),
            actions:  [
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: const Icon(
                  Icons.bookmark,
                ),
              ),
            ],
          ),
          drawer: const DrawerScreen(),
          body:  SafeArea(
            child: Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Courses",
                    style: TextStyle(
                        fontFamily: "Acme",
                        fontSize: 30,
                        color: Colors.white
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: dashBoardProvider.myCoursesInfoList.getCoursesInfoList().length,
                      separatorBuilder: (context,index){
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        );
                      },
                      itemBuilder: (context, index) {
                        return CourseDisplayUi(
                          courseImageLocation: dashBoardProvider.myCoursesInfoList.getCoursesInfoList()[index].courseImage,
                          courseName: dashBoardProvider.myCoursesInfoList.getCoursesInfoList()[index].courseName,
                          courseTeacher: dashBoardProvider.myCoursesInfoList.getCoursesInfoList()[index].courseTeacherName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

        );
      }
    );
  }
}


