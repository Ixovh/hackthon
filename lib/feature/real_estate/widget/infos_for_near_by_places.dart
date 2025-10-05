import 'package:flutter/material.dart';
import 'package:hackathon/feature/real_estate/controller/real_estate_controller.dart';

class InfosForNearByPlaces extends StatelessWidget {
  /// the will redender the UI for nearest places
  const InfosForNearByPlaces({super.key, required this.controller});

  final RealEstateController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.nearbyPlaces.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final place = controller.nearbyPlaces[index];
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade300, width: 0.8),
            ),
          ),
          child: Row(
            children: [
              // Icon circle
              Center(child: Image.asset(place['icon'], width: 28, height: 28)),
              SizedBox(width: 15),

              // Info text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      place['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'SF',
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          place['car'],
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "SF",
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(
                          Icons.directions_walk,
                          size: 15,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(
                          place['walk'],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
