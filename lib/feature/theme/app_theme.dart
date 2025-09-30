import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon/feature/theme/app_color.dart';


class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      textTheme: TextTheme(
        // for heading and page title
        titleLarge: GoogleFonts.roboto(
          color: AppColor.mainTextColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        // for main text
        titleMedium: GoogleFonts.roboto(
          color: AppColor.mainTextColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        // for main subtitle
        titleSmall: GoogleFonts.roboto(
          color: AppColor.mainTextColor,
          fontSize: 16,
        ),

        // for info text
        displaySmall: GoogleFonts.roboto(
          color: AppColor.mainTextColor,
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
      ),
      scaffoldBackgroundColor: AppColor.backGround,
      appBarTheme: AppBarTheme(backgroundColor: AppColor.backGround),

      tabBarTheme: TabBarThemeData(
        unselectedLabelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: AppColor.labelColor,
        ),

        labelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        // to change the indicator style
        
        indicator: BoxDecoration(
          color: AppColor.filledColor,
          borderRadius: BorderRadius.circular(20),
        ),
        // to hide the uderline
        dividerColor: Colors.transparent,
        // to fill up the indicator with color
        indicatorSize: TabBarIndicatorSize.tab,
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.filledColor,
        selectedItemColor: AppColor.mainTextColor,
        unselectedItemColor: AppColor.subtitleColor,
      ),
    );
  }
}
