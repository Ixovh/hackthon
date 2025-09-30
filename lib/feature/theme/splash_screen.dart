

import 'package:flutter/material.dart';
import 'package:hackathon/feature/theme/app_color.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 375,
              height: 264,
              child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
            ),
            SizedBox(height: 40),
            Text(
              'KeyNotes',
              style: TextTheme.of(context).titleLarge!.copyWith(
                color: AppColor.filledColor
              )
            ),
          ],
        ),
      ),
    );
  }
}
