import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //Constante del color primario
  static const primaryColor = Color.fromARGB(255, 14, 95, 148);
  //Constante del color secundario
  static const secondaryColor = Color.fromARGB(255, 57, 22, 255);
  //Constatnte del color de fondo
  static const backColor = Color.fromARGB(255, 168, 250, 165);

  //Definicion del tema de color y estilo de la app
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: backColor,
      appBarTheme: const AppBarTheme(color: primaryColor),
      textTheme: TextTheme(
        //Titulos de primer nivel
        headlineLarge: GoogleFonts.acme(
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: primaryColor,
          decorationStyle: TextDecorationStyle.double,
          decorationThickness: 1.5,
        ),

        // Fuente para textos muy pequenos
        bodySmall: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: secondaryColor,
            fontStyle: FontStyle.italic),
      ));
}
