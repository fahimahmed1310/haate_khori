import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/user.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:haate_khori_app/screens/dashboard_screen.dart';
import 'package:haate_khori_app/utils/reusablewidgets/app_title_ui.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/account_message_ui.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/auth_action_button_ui.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/email_form_field.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/password_form_field.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _userKey = GlobalKey<FormState>();

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
                   child: Form(
                     key: _userKey,
                     child: Column(
                       children: [
                         EmailFormField(
                           validText: "Enter your email address" ,
                           validText2: "Enter a valid email address",
                         ),
                         PasswordFormField(
                           isPasswordFieldActivate: true,
                           validText: "Enter a valid password",
                           validPasswordText: "The length of the password should be 8 or more",
                           passwordController: authProvider.passwordTextController,
                           confirmPasswordController: authProvider.confirmPasswordTextController,
                           formFieldName: "Password",
                           validConfirmPasswordText: "Confirm password is not matching" ,
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
               AuthActionButtonUi(
                 buttonName: "Login",
                 onButtonPressed: ()async{
                   FocusManager.instance.primaryFocus?.unfocus();
                   if(_userKey.currentState!.validate()){
                     User user = User(
                       email: authProvider.emailTextController.text,
                       password: authProvider.passwordTextController.text
                     );
                     await authProvider.isUserExistWhenLogin(user);
                     if(authProvider.isUserExist == true){
                       ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                         content: Text("Login Successful", style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontFamily: "Acme"
                         ),),
                         duration: Duration(seconds: 3),
                         backgroundColor: Colors.green,
                       ));
                       Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoardScreen()));
                     }else{
                       ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                         content: Text("Incorrect email or password.", style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontFamily: "Acme"
                         ),),
                         duration: Duration(seconds: 3),
                         backgroundColor: Colors.red,
                       ));
                     }
                   }
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







