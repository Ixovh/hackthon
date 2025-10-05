import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/signin_controller.dart';
import '../widget/signin_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInController(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/ExpatEase.png',
                    width: 250,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Sign in",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),

                // Form
                const SignInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
