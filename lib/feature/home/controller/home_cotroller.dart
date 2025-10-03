import 'package:flutter/material.dart';
import 'package:hackathon/feature/home/controller/community_post_model.dart';

class HomeCotroller {
  final PageController pageController = PageController(viewportFraction: 0.9);

  final List<Map<String, String>> items = [
    {
      'background': 'assets/images/promo2.jpg',
      'title': 'Restaurant picks \nmade for you',
    },

    {
      'background': 'assets/images/promo1.png',
      'title': 'Don\'t mess the offer',
    },
  ];

  final List<CommunityPost> posts =  [
  CommunityPost(
    avatar: 'assets/images/profile.jpg',
    name: 'James',
    countryFlag: 'assets/icons/uk.png',
    timeAgo: '22 min ago',
    content: 'Can someone explain how the public transport system works in Riyadh?',
  ),
  CommunityPost(
    avatar: 'assets/images/profile2.jpg',
    name: 'Krit',
    countryFlag: 'assets/icons/thailand.jpg',
    timeAgo: '22 min ago',
    content: 'Found this product in Carrefour, reminds me of home 🤍, anyone knows where...',
  ),
];
}
