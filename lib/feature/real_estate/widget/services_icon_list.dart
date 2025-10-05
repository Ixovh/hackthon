import 'package:flutter/material.dart';

class ServicesIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  const ServicesIcon({super.key, required this.iconPath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(iconPath, width: 20, height: 20, fit: BoxFit.contain),
          const SizedBox(width: 14),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'SF',
              fontSize: 14,
              color: Color(0xFF3A3A3A),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
