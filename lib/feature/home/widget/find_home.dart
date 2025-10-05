import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FindHome extends StatelessWidget {
  /// this for card Roshn Group and blurring the image
  const FindHome({super.key});

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
            Image.asset('assets/images/roshn.png', fit: BoxFit.cover),

            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              // height for adjesting blur height
              height: 100,
              // for bluring
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
              top: 24,
              right: 0,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2DBE62),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                ),
                onPressed: () {},
                child: Text(
                  'Exclusive Offer',
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Positioned(
              left: 22,
              right: 24,
              bottom: 100,
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  'Roshn Group',
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                    color: Colors.white,
                  ),
                  softWrap: true,
                ),
              ),
            ),

            Positioned(
              left: 22,
              right: 24,
              bottom: 40,
              child: SizedBox(
                width: double.infinity,
                child: Text.rich(
                  TextSpan(
                    text: 'find your home and explore\n',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'nearby schools, hospitals,\n',
                        style: TextStyle(
                          fontFamily: 'SF',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'shops and more',
                        style: TextStyle(
                          fontFamily: 'SF',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),

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
            ),
          ],
        ),
      ),
    );
  }
}
