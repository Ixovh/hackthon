import 'package:flutter/material.dart';
import 'package:hackathon/feature/splash/screen/splash_screen.dart';
import 'package:provider/provider.dart';
import 'feature/navBar/controller/navigation_controller.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

const GEMINI_API_KEY = "Your apikey";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: GEMINI_API_KEY);

  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationController(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
