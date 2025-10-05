import 'package:flutter/material.dart';
import 'package:hackathon/feature/real_estate/controller/real_estate_controller.dart';
import 'package:hackathon/feature/real_estate/widget/infos_for_near_by_places.dart';
import 'package:hackathon/feature/real_estate/widget/top_legend.dart';


class NearbyPlacesScreen extends StatelessWidget {
  const NearbyPlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RealEstateController controller = RealEstateController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Location and nearby places",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map section with legend overlay on top
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  'assets/images/map_mock.png',
                  height: 230,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Legend overlay
              TopLengendWithMap(controller: controller),
            ],
          ),

          SizedBox(height: 8),

          // Nearby places list
          Expanded(child: InfosForNearByPlaces(controller: controller)),
        ],
      ),
    );
  }
}
