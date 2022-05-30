import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Color(0xfffefcfd);
const light = Color(0xff43bccd);
const darkGreen = Color(0xff255957);
const black = Color.fromRGBO(48, 47, 48, 1.0);
const grey = Color.fromRGBO(141, 141, 141, 1.0);

TextTheme defaultTheme = TextTheme(
  headline1: TextStyle(
      color: black,fontWeight: FontWeight.w700,fontSize: 22
    ),
  headline2: TextStyle(
        color: black,fontWeight: FontWeight.w700,fontSize: 20
    ),
  headline3: TextStyle(
        color: black,fontWeight: FontWeight.w700,fontSize: 18
    ),
  headline4: TextStyle(
        color: black,fontWeight: FontWeight.w700,fontSize: 14
    ),
  headline5: TextStyle(
        color: black,fontWeight: FontWeight.w700,fontSize: 12
    ),

  headline6: TextStyle(
        color: black,fontWeight: FontWeight.w700,fontSize: 10
    ),
  bodyText1: TextStyle(
        color: black,fontWeight: FontWeight.w500,fontSize: 12
    ),
  bodyText2: TextStyle(
        color: black,fontWeight: FontWeight.w500,fontSize: 12
    ),
  subtitle1: TextStyle(
        color: black,fontWeight: FontWeight.w400,fontSize: 10
    ),
  subtitle2: TextStyle(
        color: black,fontWeight: FontWeight.w400,fontSize: 10
    ),
);