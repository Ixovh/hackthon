
import 'package:flutter/material.dart';
import 'package:hackathon/feature/home/controller/home_cotroller.dart';
import 'package:hackathon/feature/home/widget/promocard.dart';

class DisplayPromoCard extends StatelessWidget {
  const DisplayPromoCard({
    super.key,
    required this.controller,
  });

  final HomeCotroller controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          return Padding(
            padding: EdgeInsets.only(
              right: index == controller.items.length - 1 ? 0 : 12,
            ),
            child: PromoCard(data: item),
          );
        },
      ),
    );
  }
}
