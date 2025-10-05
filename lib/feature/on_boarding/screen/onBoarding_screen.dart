import 'package:flutter/material.dart';
import 'package:hackathon/feature/signIn/screen/signin_screen.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> mainTexts = [
    "Welcome to \nSaudi Arabia!",
    "Meet Ameen! \nyour AI assistant.",
    "Let’s find \nyour new home!",
    "Let’s find \nyour people!",
    "Learn & Adapt \nwith Ease",
  ];

  final List<String> subTexts = [
    "Let’s make settling easier \nfor you!",
    "Ask questions & understand government procedures in simple steps!",
    "Explore neighbourhoods, then pick your home quickly & safely!",
    "Connect & build your new community!",
    "Learn Arabic phrases, \nSaudi culture, and tips to \nblend in faster.",
  ];

  final List<String> images = [
    "assets/images/boarding1.png",
    "assets/images/boarding2.png",
    "assets/images/boarding3.png",
    "assets/images/boarding4.png",
    "assets/images/boarding5.png",
  ];

  final Color greenColor = const Color(0xFF00AA5B);

  void _goNext() {
    if (_currentPage < 4) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const SignInScreen()),
      );
    }
  }

  void _goBack() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const SignInScreen()),
    );
  }

  RichText highlightedText(String text, List<String> highlights) {
    List<TextSpan> spans = [];

    int start = 0;

    for (var highlight in highlights) {
      int index = text.indexOf(highlight, start);
      if (index < 0) continue;

      if (index > start) {
        spans.add(
          TextSpan(
            text: text.substring(start, index),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          ),
        );
      }

      spans.add(
        TextSpan(
          text: highlight,
          style: TextStyle(
            color: greenColor,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      );

      start = index + highlight.length;
    }

    if (start < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(start),
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      );
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: spans),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(mainTexts.length, (index) {
        bool isActive = index == _currentPage;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: isActive ? greenColor : Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: greenColor, width: 1),
          ),
        );
      }),
    );
  }

  List<String> getHighlights(int index) {
    switch (index) {
      case 0:
        return ["Welcome"];
      case 1:
        return ["Ameen"];
      case 2:
        return ["your new home!"];
      case 3:
        return ["your people!"];
      case 4:
        return ["Learn & Adapt"];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    highlightedText(mainTexts[index], getHighlights(index)),
                    const SizedBox(height: 30),
                    Image.asset(
                      images[index],
                      width: 300,
                      height: 300,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      subTexts[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Skip text
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: _skip,
              child: Text(
                "Skip",
                style: TextStyle(
                  color: greenColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage >= 1)
                  GestureDetector(
                    onTap: _goBack,
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: greenColor, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(Icons.arrow_back, color: greenColor),
                    ),
                  )
                else
                  const SizedBox(width: 50),
                // Dots
                buildDots(),

                GestureDetector(
                  onTap: _goNext,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
