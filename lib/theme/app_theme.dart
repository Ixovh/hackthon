import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/theme/app_color.dart';


class AppTheme {
  static ThemeData themeApp() {
    return ThemeData(
      textTheme: TextTheme(
        // for heading and page title
        titleLarge: GoogleFonts.roboto(
          color: AppColor.lightMainTextColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        // for main text
        titleMedium: GoogleFonts.roboto(
          color: AppColor.lightMainTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: GoogleFonts.roboto(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: AppColor.lightBackGround,
      appBarTheme: AppBarTheme(backgroundColor: AppColor.lightBackGround),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.lightBackGround,
        selectedItemColor: Color(0xFF00AA5B),
        unselectedItemColor: Colors.grey.shade600,
      ),

    );
  }

}
