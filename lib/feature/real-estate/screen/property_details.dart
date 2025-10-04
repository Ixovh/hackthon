import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/feature/real-estate/screen/nearby_places.dart';
import 'package:hackathon/feature/real-estate/widget/contact_model_sheet.dart';
import 'package:hackathon/feature/real-estate/widget/details_images.dart';
import 'package:hackathon/feature/real-estate/widget/row_for_info_details.dart';

class PropertyDetailsScreen extends StatelessWidget {
  final String price = "30,000";
  final int bedrooms = 2;
  final int bathrooms = 1;
  final String location = "Riyadh, Al Narjis";

  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  DetailsImages(path: 'assets/images/room.png'),
                  DetailsImages(path: 'assets/images/room2.png'),
                  DetailsImages(path: 'assets/images/room3.png'),
                ],
              ),

              // Info Card Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset('assets/icons/saudi-riyal.svg'),
                            Text(
                              " $price",
                              style: TextStyle(
                                color: Color(0xFF2DBE62),
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "/year",
                              style: TextStyle(
                                color: Color(0xFF2DBE62),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),

                        // Bedrooms and bathrooms
                        RowForInfo(bedrooms: bedrooms, bathrooms: bathrooms),

                        SizedBox(height: 5),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SF',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NearbyPlacesScreen(),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.map_outlined,
                            color: Color(0xFFCC5805),
                            size: 16,
                          ),
                          label: Text(
                            'Nearby places',
                            style: TextStyle(
                              color: Color(0xFFCC5805),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    // Contact Owner button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 16,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                      24,
                                ),
                                child: ContactModalBottomSheet(
                                  context: context,
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          backgroundColor: Color(0xFFCC5805),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          "Contact Owner",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
