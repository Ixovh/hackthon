import 'package:flutter/material.dart';
import '../controller/intro_controller.dart';
import '../widget/option_box.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = IntroController(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: controller.buildAppBarTitle(),
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: controller.goBack,
        ),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 150),
                      controller.buildChatbotAvatar(),
                      const SizedBox(height: 30),
                      controller.buildGreetingText(),
                      const SizedBox(height: 40),

                      // ✅ Option boxes row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: controller.optionData
                              .map(
                                (option) => Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: OptionBox(
                                    imagePath: option['image']!,
                                    text: option['text']!,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),

                      const Spacer(),

                      controller.buildBottomInput(context),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
