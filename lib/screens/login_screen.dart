import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:haate_khori_app/reusablewidgets/app_title_ui.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/account_message_ui.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/auth_action_button_ui.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/password_form_field.dart';
import 'package:haate_khori_app/screens/dashboard_page.dart';
import 'package:provider/provider.dart';

import '../reusablewidgets/authentication_pages_widgets/email_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Consumer<AuthenticationProvider>(
      builder: (_,authProvider,___){
       return  Scaffold(
         body: SafeArea(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               const Expanded(
                 flex: 2,
                 child: AppTitleUi(),
               ),
               Expanded(
                 flex: 2,
                 child: SingleChildScrollView(
                   physics: NeverScrollableScrollPhysics(),
                   child: Column(
                     children: [
                       EmailFormField(),
                       PasswordFormField(
                         formFieldName: "Password",
                       ),
                     ],
                   ),
                 ),
               ),
               AuthActionButtonUi(
                 buttonName: "Login",
                 onButtonPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashBoardPage()));
                 },
               ),
               AccountMessageUi(
                 screenName: "Signup".toUpperCase(),
                 noticeToUser: "Didn't have an account?",
               ),

             ],
           ),
         ),
       );
      }
    );
  }
}







