import 'package:flutter/material.dart';

class EmailFormField extends StatefulWidget {
  const EmailFormField({
    super.key,
  });

  @override
  State<EmailFormField> createState() => _EmailFormFieldState();
}

class _EmailFormFieldState extends State<EmailFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        onChanged: (value){
        },
        decoration: InputDecoration(
          fillColor: Colors.white10,
          filled: true,
          //errorText: "Enter a valid email address",
          //errorStyle: TextStyle(
          // fontSize: 15,
          //  fontFamily: "Acme"
          //),


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

      ),
    );
  }
}