import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData mainTheme = ThemeData(
    fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: CustomColors.kPrimary,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: CustomColors.kLightBackground,
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: CustomColors.kPrimary,
        selectionColor: CustomColors.kPrimary),
    buttonTheme: ButtonThemeData(buttonColor: CustomColors.kPrimary),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: CustomColors.kDarkBlue),
      color: CustomColors.kBackground,
    ));

SystemUiOverlayStyle defaultOverlay = const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.black,
    systemNavigationBarColor: Colors.black);
