import 'package:flutter/material.dart';
import 'package:haate_khori_app/models/user.dart';
import 'package:haate_khori_app/repositories/authentication_repository.dart';


class AuthenticationProvider with ChangeNotifier{


  bool? _isLoginPage = true;// App goes to LoginPage first, used it to rotate from login page to register page when bottom text is pressed.
  bool? _isUserExist;
  bool? _insertNewUserSuccessful;
  TextEditingController? _emailTextController = TextEditingController();
  TextEditingController? _passwordTextController = TextEditingController();
  TextEditingController? _confirmPasswordTextController = TextEditingController();













  bool get isLoginPage => _isLoginPage!;
  set isLoginPage(bool value) {
    _isLoginPage = value;
    notifyListeners();
  }



  bool get isUserExist => _isUserExist!;
  set isUserExist(bool value) {
    _isUserExist = value;
    notifyListeners();
  }



  TextEditingController get emailTextController => _emailTextController!;
  set emailTextController(TextEditingController value) {
    _emailTextController = value;
    notifyListeners();
  }






  TextEditingController get passwordTextController => _passwordTextController!;

  set passwordTextController(TextEditingController value) {
    _passwordTextController = value;
    notifyListeners();
  }


  TextEditingController get confirmPasswordTextController =>
      _confirmPasswordTextController!;

  set confirmPasswordTextController(TextEditingController value) {
    _confirmPasswordTextController = value;
    notifyListeners();
  }


  bool get insertNewUserSuccessful => _insertNewUserSuccessful!;

  set insertNewUserSuccessful(bool value) {
    _insertNewUserSuccessful = value;
    notifyListeners();
  }







  Future<void> isUserExistWhenRegistration (String email) async{
    try{
      isUserExist = await AuthenticationRepository.isUserExistWhenRegistration(email);
    }catch(error){
      print(error);
    }
    notifyListeners();
  }




  Future<void> insertNewUser (User user) async{
    try{
      insertNewUserSuccessful = await AuthenticationRepository.insertNewUser(user);
    }catch(error){
      print(error);
    }
    notifyListeners();
  }

  Future<void> isUserExistWhenLogin (User user) async{
    try{
      isUserExist = await AuthenticationRepository.isUserExistWhenLogin(user);
    }catch(error){
      print(error);
    }
    notifyListeners();
  }



}