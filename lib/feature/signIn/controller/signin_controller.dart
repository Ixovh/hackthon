import 'package:flutter/material.dart';

import 'package:hackathon/feature/navBar/screen/navigation_bar.dart';

class SignInController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool rememberMe = false;

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  void signIn(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NavigationScreen()),
      );
    }
  }
}
