import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:haate_khori_app/screens/login_screen.dart';
import 'package:haate_khori_app/screens/register_screen.dart';
import 'package:provider/provider.dart';


class AccountMessageUi extends StatefulWidget {
  final String? screenName;
  final String? noticeToUser;


  AccountMessageUi({@required this.screenName, @required this.noticeToUser});

  @override
  State<AccountMessageUi> createState() => _AccountMessageUiState();
}

class _AccountMessageUiState extends State<AccountMessageUi> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (_,authProvider,___){
          return Expanded(
            flex:1,
            child: Center(
              child: RichText(
                text:  TextSpan(
                  text: "${widget.noticeToUser}",
                  style: const TextStyle(
                      fontSize: 20,
                      fontFamily: "Acme"
                  ),
                  children:  <TextSpan>[
                    TextSpan(
                      text: " ${widget.screenName}",
                      style: const TextStyle(
                        fontFamily: "Acme",
                        decoration: TextDecoration.underline,
                      ),
                      recognizer:  TapGestureRecognizer()
                        ..onTap = () {
                          if(authProvider.isLoginPage == true){
                            authProvider.isLoginPage = false;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                          }else{
                            authProvider.isLoginPage = true;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                          }
                        }

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