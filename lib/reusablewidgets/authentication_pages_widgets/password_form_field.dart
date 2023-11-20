
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final String? formFieldName;


  PasswordFormField({@required this.formFieldName});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        onChanged: (value){
          print(value);
        },
        decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          //errorText: "Enter a valid email address",
          //errorStyle: TextStyle(
          // fontSize: 15,
          //  fontFamily: "Acme"
          //),


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

      ),
    );
  }
}