import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  const SocialButton({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        shape: BoxShape.circle,
      ),
      child: Image.asset(assetPath),
    );
  }
}
