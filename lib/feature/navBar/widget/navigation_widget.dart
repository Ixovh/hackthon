import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/navigation_controller.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  final Color activeColor = const Color(0xFF00AA5B);
  final Color inactiveColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<NavigationController>();
    int tabIndex = controller.tabIndex;

    
    final List<String> navImages = [
      "assets/images/House.png", // Home
      "assets/images/Compass.png", // Explore
      "assets/images/Light.png", // Learn
      "assets/images/BuildingOffice.png", // Real Estate
    ];

    final List<String> navLabels = ["Home", "Explore", "Learn", "Real Estate"];

    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navImages.length + 1, (i) {
          
            if (i == 2) return const SizedBox(width: 40);
            int index = i > 2 ? i - 1 : i; 
            bool isSelected = tabIndex == index;

            return GestureDetector(
              onTap: () => controller.setTabIndex(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Image.asset(
                      navImages[index],
                      color: isSelected ? activeColor : inactiveColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    navLabels[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? activeColor : inactiveColor,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
