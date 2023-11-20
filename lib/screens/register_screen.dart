import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:haate_khori_app/reusablewidgets/app_title_ui.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/account_message_ui.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/auth_action_button_ui.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/email_form_field.dart';
import 'package:haate_khori_app/reusablewidgets/authentication_pages_widgets/password_form_field.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

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
                          child: Column(
                            children: [
                              EmailFormField(),
                              PasswordFormField(
                                formFieldName: "Password",
                              ),
                              PasswordFormField(
                                formFieldName: "Confirm Password",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  AuthActionButtonUi(
                    buttonName: "Register".toUpperCase(),
                    onButtonPressed: (){

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
