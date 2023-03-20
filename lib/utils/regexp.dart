import 'package:flutter/material.dart';

String? emailValidator(String email, String emailValidateMessage) {
  if (email.isEmpty) {
    return "Silahkan Isi Email Anda !";
  } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
    return "Email Tidak Valid!";
  } else if (emailValidateMessage != "") {
    return emailValidateMessage;
  } else {
    return null;
  }
}
