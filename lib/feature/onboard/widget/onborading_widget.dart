import 'package:flutter/material.dart';

class OnboradingWidget extends StatelessWidget {
  final String title;
  final String description;

  const OnboradingWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Text(
          description,
          style: Theme.of(context).textTheme.titleSmall,
          // to prevent the overlaping text and starting up from left
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
