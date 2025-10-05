import 'package:flutter/material.dart';
import 'package:hackathon/feature/chat/screen/intro_screen.dart';
import 'package:hackathon/feature/real_estate/screen/real_estate.dart';
import 'package:provider/provider.dart';
import '../controller/navigation_controller.dart';
import '../widget/navigation_widget.dart';
import '../../home/screen/home_screen.dart';
import '../../community/screen/community_screen.dart';
import '../../learn/screen/learn_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NavigationController>();
    int tabIndex = controller.tabIndex;

    final pages = [
      const HomeScreen(),
      const CommunityScreen1(),
      const LearnScreen(),
      const RealEstate(),
    ];

    return Scaffold(
      extendBody: true,
      body: pages[tabIndex],
      bottomNavigationBar: const NavigationWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
     
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const IntroScreen()),
          );
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: Color(0xFF00AA5B),
            shape: BoxShape.circle,
          ),
          child: Image.asset("assets/images/Ellipse 219.png"),
        ),
      ),
    );
  }
}
