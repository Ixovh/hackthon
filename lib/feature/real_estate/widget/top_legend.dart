
import 'package:flutter/material.dart';
import 'package:hackathon/feature/real_estate/controller/real_estate_controller.dart';

class TopLengendWithMap extends StatelessWidget {
  /// this will render the UI for map with top centre legend 
  const TopLengendWithMap({
    super.key,
    required this.controller,
  });

  final RealEstateController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 6,
        ),
        child: Row(
          children: controller.categories.map((category) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: category['title'] == 'All'
                    ? Color(0xFF2DBE62)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset:    Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (category['icon'] != null) ...[
                    Image.asset(
                      category['icon'],
                      width: 28,
                      height: 28,
                    ),
                       SizedBox(width: 6),
                  ],
                  Text(
                    category['title'],
                    style: TextStyle(
                      color: category['color'],
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'SF',
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
