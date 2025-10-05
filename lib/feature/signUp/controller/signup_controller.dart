import 'package:flutter/material.dart';
import 'package:hackathon/feature/navBar/screen/navigation_bar.dart';

class SignUpController with ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool agree = false;
  String? selectedNationality;

  final List<String> nationalities = [
    'Pakistan',
    'United States (US)',
    'England',
    'Egyptian',
    'Indian',
    'Turkey',
    'Other',
  ];

  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void setAgreement(bool value) {
    agree = value;
    notifyListeners();
  }

  void setNationality(String? value) {
    selectedNationality = value;
    notifyListeners();
  }

  void signUp(BuildContext context) {
    if (formKey.currentState!.validate() && agree) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavigationScreen()),
      );
    }
  }
}
