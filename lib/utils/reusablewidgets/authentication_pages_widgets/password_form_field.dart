import 'package:flutter/material.dart';
import 'package:haate_khori_app/providers/authentication_provider.dart';
import 'package:provider/provider.dart';

class PasswordFormField extends StatefulWidget {
  final String? formFieldName;
  final String? validText;
  final String? validConfirmPasswordText;
  final String? validPasswordText;
  final bool? isPasswordFieldActivate;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;



  PasswordFormField({
    required this.formFieldName,
    required this.validText,
    @required this.validConfirmPasswordText,
    required this.validPasswordText,
    required this.isPasswordFieldActivate,
    required this.passwordController,
    required this.confirmPasswordController,
  });


  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        controller: widget.isPasswordFieldActivate == true? widget.passwordController
            : widget.confirmPasswordController,
        decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          errorStyle: const TextStyle(
              fontSize: 15,
              fontFamily: "Acme"
          ),


          labelText: '${widget.formFieldName}',
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
        validator: (value) {
          if(value == null || value.isEmpty){
            return widget.validText;
          }else if(widget.isPasswordFieldActivate == true){

            if(widget.passwordController!.text.length<7){
              return widget.validPasswordText;
            }else{
              return null;
            }

          }else if(widget.isPasswordFieldActivate == false){
            if( widget.passwordController!.text == widget.confirmPasswordController!.text ){
              return null;
            }else{
              return widget.validConfirmPasswordText;
            }
          }else{
            return null;
          }
        },
      ),
    );;
  }
}