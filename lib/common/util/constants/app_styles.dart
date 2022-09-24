import 'package:flutter/material.dart';

class AppStyles {
  static ButtonStyle BTN_STYLE = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    elevation: 0,
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
    ),
  );

  static TextStyle BTN_TXT_STYLE=TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w400);

  static TextStyle HEADER_TXT_STYLE=TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  static UnderlineInputBorder underlineInputBorder = UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.blue),
  );

  static TextStyle hintStyle=TextStyle(
    fontSize: 20,
    color: Colors.black,);
}