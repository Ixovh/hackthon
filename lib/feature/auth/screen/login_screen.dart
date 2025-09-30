import 'package:flutter/material.dart';
import 'package:hackathon/feature/auth/controller/auth_controller.dart';
import 'package:hackathon/feature/auth/screen/signup_screen.dart';
import 'package:hackathon/feature/theme/app_color.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _authController.formKey,
            child: ListView(
              children: [
                SizedBox(height: 40),

                Text(
                  "Welcome Back! 👋",
                  style: TextTheme.of(context).titleLarge,
                ),
                SizedBox(height: 8),
                Text(
                  "Please fill up and login to your account",
                  style: TextTheme.of(
                    context,
                  ).titleSmall!.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 40),

                TextFormField(
                  controller: _authController.emailController,
                  style: TextTheme.of(context).titleSmall,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),

                TextFormField(
                  controller: _authController.passwordController,
                  obscureText: _authController.obscureText,
                  style: TextTheme.of(context).titleSmall,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[900],
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _authController.obscureText =
                              !_authController.obscureText;
                        });
                      },
                      icon: Icon(
                        _authController.obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.filledColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_authController.formKey.currentState!.validate()) {
                      //   Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => BottonNavbar(),
                      //     ),
                      //   );
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextTheme.of(context).titleMedium,
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Divider text
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or continue with",
                        style: TextTheme.of(context).titleSmall,
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/Google.png'),
                    SizedBox(width: 20),
                    Image.asset('assets/images/Facebook.png'),
                  ],
                ),

                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextTheme.of(
                        context,
                      ).titleSmall!.copyWith(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Create one",
                        style: TextTheme.of(context).titleSmall!.copyWith(
                          color: AppColor.filledColor,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
