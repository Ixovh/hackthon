import 'package:flutter/material.dart';

class OnboardingController {
  PageController pageController = PageController();
  List<Map<String, String>> onboardingData = [
    {
      'title': 'Where Every Key Whispers Luxury',
      'description':
          'Step into a world of exquisite pianos and let elegance play your first note',
    },
    {
      'title': 'Experience True Harmony',
      'description':
          'Feel the richness of every note and the luxury of playing on a masterfully designed piano.',
    },
    {
      'title': 'Bring Music TO Life',
      'description':
          'Choose, purchase, and enjoy the piano of your dreams with effortless elegance and style.',
    },
  ];
}
