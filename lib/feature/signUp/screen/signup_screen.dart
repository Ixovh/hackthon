import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/signup_controller.dart';
import '../widget/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/ExpatEase.png',
                    width: 250,
                    height: 200,
                  ),
                ),

                // Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 36),

                const SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
