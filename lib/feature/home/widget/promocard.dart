import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PromoCard extends StatelessWidget {
  /// this promocard is taking data from controller and rendering the UI
  const PromoCard({super.key, required this.data});
  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(26),
      child: SizedBox(
        height: 310,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(data['background']!, fit: BoxFit.cover),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: 50,
              child: ClipRect(
                child: BackdropFilter(
                  filter: ui.ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.0),
                          Colors.black.withValues(alpha: 0.4),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 24,
              right: 24,
              bottom: 20,
              child: Text.rich(
                TextSpan(
                  text: "${data['title'] ?? ''}  ",
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontSize: 20,
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  children: [
                    WidgetSpan(
                      alignment: ui.PlaceholderAlignment.middle,
                      child: Image.asset(
                        'assets/images/ArrowUp.png',
                        width: 20,
                        height: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
