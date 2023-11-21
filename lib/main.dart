import 'package:flutter/material.dart';
import 'package:haate_khori_app/constants/app_constants.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:haate_khori_app/providers/dashboard_provider.dart';
import 'package:haate_khori_app/screens/splash_screen.dart';
import 'package:haate_khori_app/screens/test.dart';
import 'package:haate_khori_app/screens/test2.dart';


import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthenticationProvider>(create: (context) => AuthenticationProvider()),
          ChangeNotifierProvider<DashBoardProvider>(create: (context) => DashBoardProvider()),
        ],
      child: const HaateKhori(),
    )
  );
}

class HaateKhori extends StatelessWidget {
  const HaateKhori({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppConstants.backgroundColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
        ),
      ),
      title: AppConstants.appTitle,
      home:  SampleVideo(),
    );
  }
}
