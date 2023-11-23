import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class EmailFormField extends StatefulWidget {

  final String? validText;
  final String? validText2;

  EmailFormField({
        required this.validText,
        required this.validText2
  });

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (_,authProvider,___){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
           style: const TextStyle(color: Colors.white,fontFamily: "Acme"),

            controller: authProvider.emailTextController,
            decoration: InputDecoration(
              fillColor: Colors.white10,
              filled: true,


              errorStyle: const TextStyle(
                  fontSize: 15,
                  fontFamily: "Acme"
              ),


              labelText: 'Email',
              labelStyle: const TextStyle(
                  fontFamily: "Acme",
                  fontSize: 20,
                  color: Colors.white
              ),

              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            validator: (value){
              if(value == null || value.isEmpty){
                return widget.validText;
              }else if(EmailValidator.validate(authProvider.emailTextController.text) == true){
                return null;
              }else{
                return widget.validText2;
              }
            },

          ),
        );
      }
    );
  }
}