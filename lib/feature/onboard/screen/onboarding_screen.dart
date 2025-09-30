import 'package:flutter/material.dart';
import 'package:hackathon/feature/auth/screen/login_screen.dart';
import 'package:hackathon/feature/onboard/controller/onboarding_controller.dart';
import 'package:hackathon/feature/onboard/widget/onborading_widget.dart';
import 'package:hackathon/feature/theme/app_color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController controller = OnboardingController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // to set image as background
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboard.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 600),
              SizedBox(
                height: 150,
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withValues(alpha: 0.20),
                      ],
                      stops: [0.04, 1],
                    ),
                  ),
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.onboardingData.length,
                    onPageChanged: (value) {
                      currentIndex = value;
                      setState(() {});
                    },
                    itemBuilder: (context, index) {
                      // to build the repeated UI
                      return OnboradingWidget(
                        title: controller.onboardingData[index]['title']!,
                        description:
                            controller.onboardingData[index]['description']!,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 32),

              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(56, 56),
                    shape: CircleBorder(),
                    backgroundColor: AppColor.filledColor,
                  ),
                  onPressed: () {
                    // check if user reached last screen or not if it yes forward it to home screen
                    if (controller.onboardingData.length - 1 == currentIndex) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      // if user doesnt reache continue sliding
                      controller.pageController.nextPage(
                        duration: Duration(microseconds: 1),
                        curve: Curves.bounceInOut,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),

              SmoothPageIndicator(
                controller: controller.pageController,
                count: controller.onboardingData.length,
                effect: ExpandingDotsEffect(
                  activeDotColor: AppColor.filledColor,
                  dotColor: Color(0xFF1F1F1F),
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
