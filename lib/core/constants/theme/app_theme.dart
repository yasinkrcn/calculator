import 'package:calculator/core/_core_exports.dart';


import 'package:google_fonts/google_fonts.dart';


class AppTheme {

  static Color lightPrimaryColor = Colors.deepOrangeAccent;


  static Color darkPrimaryColor = Colors.orange;


  static String? fontFamily = GoogleFonts.workSans().fontFamily;


  static final ThemeData lightTheme = ThemeData(

    scaffoldBackgroundColor: AppColors.lightBg,

    brightness: Brightness.light,

    primaryColor: lightPrimaryColor,

    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: darkPrimaryColor),

    fontFamily: fontFamily,

    elevatedButtonTheme: ElevatedButtonThemeData(

        style: ButtonStyle(

            padding:

                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),

            shape: MaterialStateProperty.all<OutlinedBorder>(

                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),

            backgroundColor: MaterialStateProperty.all<Color>(darkPrimaryColor))),

    inputDecorationTheme: InputDecorationTheme(

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),

        filled: true,

        fillColor: Colors.grey.withOpacity(0.1)),

  );


  static final ThemeData darkTheme = ThemeData(

    scaffoldBackgroundColor: AppColors.darkBg,

    brightness: Brightness.dark,

    switchTheme: SwitchThemeData(

      trackColor: MaterialStateProperty.all<Color>(Colors.grey),

      thumbColor: MaterialStateProperty.all<Color>(Colors.white),

    ),

    fontFamily: fontFamily,

    inputDecorationTheme: InputDecorationTheme(

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0), borderSide: BorderSide.none),

        filled: true,

        fillColor: Colors.grey.withOpacity(0.1)),

    elevatedButtonTheme: ElevatedButtonThemeData(

        style: ButtonStyle(

            padding:

                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),

            shape: MaterialStateProperty.all<OutlinedBorder>(

                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),

            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),

            overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),

  );

}

