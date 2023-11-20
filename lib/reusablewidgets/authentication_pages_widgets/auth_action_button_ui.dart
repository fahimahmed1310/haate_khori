import 'package:flutter/material.dart';

class AuthActionButtonUi extends StatefulWidget {
  final String? buttonName;
  final Function()? onButtonPressed;


  AuthActionButtonUi({@required this.buttonName, @required this.onButtonPressed});

  @override
  State<AuthActionButtonUi> createState() => _AuthActionButtonUiState();
}

class _AuthActionButtonUiState extends State<AuthActionButtonUi> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white24,
      ),
      onPressed: widget.onButtonPressed,
      child: Text(
        widget.buttonName!.toUpperCase(),
        style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: "Acme",
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}