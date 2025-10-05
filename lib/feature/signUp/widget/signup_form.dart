import 'package:flutter/material.dart';
import 'package:hackathon/feature/signIn/screen/signin_screen.dart';

import 'package:provider/provider.dart';
import '../controller/signup_controller.dart';
import '../widget/social_button.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SignUpController>(context);

 
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
          Text(
            "Name",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4),
          TextFormField(decoration: inputDecoration.copyWith(hintText: 'Name')),
          SizedBox(height: 18),

          Text(
            "Email",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4),
          TextFormField(
            decoration: inputDecoration.copyWith(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 18),

          Text(
            "Nationality",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4),
 DropdownButtonFormField<String>(
  decoration: inputDecoration.copyWith(hintText: 'Nationality'),
  value: controller.selectedNationality,
  dropdownColor: Colors.white, // makes the dropdown background white
  items: controller.nationalities
      .map(
        (nation) => DropdownMenuItem(
          value: nation,
          child: Text(
            nation,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      )
      .toList(),
  onChanged: controller.setNationality,
),

          SizedBox(height: 18),

          Text(
            "Password",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4),
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
          SizedBox(height: 10.5),

          // Checkbox
          Row(
            children: [
              Checkbox(
                value: controller.agree,
                onChanged: (val) => controller.setAgreement(val ?? false),
                activeColor: const Color(0xFF00AA5B),
              ),
              Text(
                "I agree to the",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                " Terms & Condition",
                style: TextStyle(
                  color: Color(0xFF00AA5B),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          Center(
            child: SizedBox(
              width: 278,
              height: 54,
              child: ElevatedButton(
                onPressed: controller.agree
                    ? () => controller.signUp(context)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00AA5B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), 
                  ),
                ),
                child: Text(
                  'Sign Up',
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
              const Expanded(
                child: Divider(color: Colors.grey, thickness: 1, endIndent: 7),
              ),
              const Text(
                "Or sign up with",
                style: TextStyle(color: Colors.black54),
              ),
              const Expanded(
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

          // Redirect to Sign In
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Color(0xFF00AA5B),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
