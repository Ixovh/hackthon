import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/feature/on_boarding/screen/onBoarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _startAnimations();
  }

  Future<void> _startAnimations() async {
    _controller1.forward();
    await Future.delayed(const Duration(milliseconds: 900));
    _controller2.forward();
    await Future.delayed(const Duration(milliseconds: 900));
    _controller3.forward();

    await Future.delayed(const Duration(milliseconds: 1400));

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox.expand(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0, 3),
                      end: const Offset(0, 0.06),
                    ).animate(
                      CurvedAnimation(
                        parent: _controller1,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/Group.svg',
                    width: 200,
                    height: 27,
                  ),
                ),
              ),

              SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0, 3),
                      end: const Offset(0, 0.01),
                    ).animate(
                      CurvedAnimation(
                        parent: _controller2,
                        curve: Curves.easeOutCubic,
                      ),
                    ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/ExpatEase2.png',
                    width: 250,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(-3, 0),
                      end: const Offset(0, -0.01),
                    ).animate(
                      CurvedAnimation(
                        parent: _controller3,
                        curve: Curves.easeOutBack,
                      ),
                    ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/1.png',
                    width: 150,
                    height: 200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
