import 'dart:async';

import 'package:flutter/material.dart';
import 'package:haate_khori_app/constants/app_constants.dart';
import 'package:haate_khori_app/reusablewidgets/app_title_ui.dart';
import 'package:haate_khori_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()),
              (Route<dynamic> route) => false);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       body: Column(
         children: [
           Expanded(
             flex: 4,
             child: AppTitleUi(),
           ),
           Expanded(
             flex: 1,
               child:  Center(
                   child:
                   Padding(
                     padding: EdgeInsets.all(15.0),
                     child: LinearProgressIndicator(
                       color: Colors.white,
                       backgroundColor: AppConstants.backgroundColor,
                     ),
                   ),
               ),
           ),

         ],
       ),
    );
  }
}


