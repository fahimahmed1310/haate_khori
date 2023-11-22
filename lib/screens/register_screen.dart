import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/user.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:haate_khori_app/screens/login_screen.dart';
import 'package:haate_khori_app/utils/reusablewidgets/app_title_ui.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/account_message_ui.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/auth_action_button_ui.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/email_form_field.dart';
import 'package:haate_khori_app/utils/reusablewidgets/authentication_pages_widgets/password_form_field.dart';
import 'package:haate_khori_app/utils/reusablewidgets/custom_snackbar.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _userKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return   Consumer<AuthenticationProvider>(
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
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Center(
                          child: Form(
                            key: _userKey,
                            child: Column(
                              children: [
                                EmailFormField(
                                  validText: "Enter your email address",
                                  validText2: "Enter a valid email address",
                                ),
                                PasswordFormField(
                                  passwordController: authProvider.passwordTextController,
                                  confirmPasswordController: authProvider.confirmPasswordTextController,
                                  isPasswordFieldActivate : true,
                                  formFieldName: "Password",
                                  validText: "Enter a valid password",
                                  validPasswordText: "The length of the password should be 8 or more",
                                  validConfirmPasswordText: "Confirm password is not matching",
                                ),
                                PasswordFormField(
                                  passwordController: authProvider.passwordTextController,
                                  confirmPasswordController: authProvider.confirmPasswordTextController,
                                  isPasswordFieldActivate : false,
                                  formFieldName: "Password",
                                  validText: "Enter a valid password",
                                  validPasswordText: "The length of the password should be 8 or more",
                                  validConfirmPasswordText: "Confirm password is not matching",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  AuthActionButtonUi(
                    buttonName: "Register".toUpperCase(),
                    onButtonPressed: ()async{
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(_userKey.currentState!.validate()){
                        User user = User(
                          email: authProvider.emailTextController.text,
                          password: authProvider.passwordTextController.text,
                        );
                        await authProvider.isUserExistWhenRegistration(user.email);
                        if(authProvider.isUserExist == true){
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Center(
                                  child: Text("User is exist", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Acme",
                                      fontSize: 15
                                  ),),
                                ),
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.red,
                              ));
                        }else{
                          await authProvider.insertNewUser(user);
                          if(authProvider.insertNewUserSuccessful){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Registration Is  Complete",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Acme",

                                  ),),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.green,
                                ));
                            authProvider.passwordTextController.text = "";
                            authProvider.confirmPasswordTextController.text = "";
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
                              content: Text("Registration Is Not Complete", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Acme"
                              ),),
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Registration Is Not Complete", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Acme"
                          ),),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        )
                        );
                      }
                    },
                  ),
                  AccountMessageUi(
                    noticeToUser: "Have an account already?",
                    screenName: "Login".toUpperCase(),
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
}
