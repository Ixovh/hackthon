import 'package:flutter/material.dart';
import 'package:hackathon/feature/signUp/screen/signup_screen.dart';
import 'package:hackathon/feature/signUp/widget/social_button.dart';
import 'package:provider/provider.dart';
import '../controller/signin_controller.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignInController>(context);

    // Common Input Decoration 
    final inputDecoration = InputDecoration(
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Color(0xFFE9EBED)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Color(0xFFE9EBED)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Color(0xFF00AA5B), width: 2),
      ),
    );

    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4),
          TextFormField(
            decoration: inputDecoration.copyWith(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),

          const Text(
            "Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 4),
          TextFormField(
            obscureText: controller.obscurePassword,
            decoration: inputDecoration.copyWith(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  controller.obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: Colors.grey,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            ),
          ),

          // Checkbox (Remember me)
          Row(
            children: [
              Checkbox(
                value: controller.rememberMe,
                onChanged: (val) => controller.setRememberMe(val ?? false),
                activeColor: const Color(0xFF00AA5B),
              ),
              const Text(
                "Remember me",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              SizedBox(width: 70),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forget password?",
                    style: TextStyle(
                      color: Color(0xFF00AA5B),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF00AA5B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),

          // Sign In Button 
          Center(
            child: SizedBox(
              width: 278,
              height: 54,
              child: ElevatedButton(
                onPressed: () => controller.signIn(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00AA5B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24),

          Row(
            children: [
              Expanded(
                child: Divider(color: Colors.grey, thickness: 1, endIndent: 7),
              ),
              Text("Or sign up with", style: TextStyle(color: Colors.black54)),
              Expanded(
                child: Divider(color: Colors.grey, thickness: 1, indent: 7),
              ),
            ],
          ),
          SizedBox(height: 16),

          // Social Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialButton(
                assetPath: 'assets/images/material-icon-theme_google.png',
              ),
              SizedBox(width: 14),
              SocialButton(assetPath: 'assets/images/devicon_apple.png'),
              SizedBox(width: 14),
              SocialButton(assetPath: 'assets/images/gg_facebook.png'),
            ],
          ),
          SizedBox(height: 24),

          // Redirect to Sign Up
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Color(0xFF00AA5B),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
