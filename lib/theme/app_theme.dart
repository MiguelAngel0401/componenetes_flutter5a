import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //Constante del color primario
  static const primaryColor = Color.fromARGB(255, 14, 95, 148);
  //Constante del color secundario
  static const secondaryColor = Color.fromARGB(255, 57, 22, 255);
  //Constatnte del color de fondo
  static const backColor = Color.fromARGB(255, 168, 250, 165);
  //Constante del color para los botones
  static const widgetsColor = Color.fromARGB(255, 48, 255, 75);
  //Constante del color cuando los botones y widgets deshabilitados
  static const disabledWidgetColor = Color.fromARGB(255, 150, 150, 150);

  //Definicion del tema de color y estilo de la app
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      //Colores del tema claro
      scaffoldBackgroundColor: backColor,
      appBarTheme: AppBarTheme(
          color: primaryColor,
          titleTextStyle: GoogleFonts.laila(
              color: backColor, fontSize: 28.5, fontWeight: FontWeight.bold)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widgetsColor),
              foregroundColor: MaterialStateProperty.all(primaryColor),
              textStyle: MaterialStateProperty.all(GoogleFonts.adamina(
                fontSize: 28.5,
              )))),
      iconTheme: const IconThemeData(color: primaryColor, size: 35.0),

      //Estilo del texto
      textTheme: TextTheme(
        //Titulos de primer nivel
        headlineLarge: GoogleFonts.acme(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: primaryColor,
          decorationStyle: TextDecorationStyle.double,
          decorationThickness: 1.5,
        ),

        headlineMedium: GoogleFonts.alexandria(
          fontSize: 25.5,
          fontWeight: FontWeight.w700,
          color: secondaryColor,
        ),

        // Fuente para textos muy pequenos
        bodySmall: GoogleFonts.montserrat(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: secondaryColor,
            fontStyle: FontStyle.italic),
      ));
}
