
import 'package:flutter/material.dart';

class RowForInfo extends StatelessWidget {
  const RowForInfo({
    super.key,
    required this.bedrooms,
    required this.bathrooms,
  });

  final int bedrooms;
  final int bathrooms;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.bed_outlined,
          size: 16,
          color: Color(0xFF5A5A5A),
        ),
        SizedBox(width: 4),
        Text(
          "$bedrooms Bedrooms",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF',
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.bathtub_outlined,
          size: 16,
          color: Color(0xFF5A5A5A),
        ),
        SizedBox(width: 4),
        Text(
          "$bathrooms Bathroom",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF',
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.kitchen_outlined,
          size: 16,
          color: Color(0xFF5A5A5A),
        ),
        SizedBox(width: 4),
        Text(
          "Kitchen",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF',
          ),
        ),
      ],
    );
  }
}