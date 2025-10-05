import 'package:flutter/material.dart';
import 'package:hackathon/feature/real_estate/screen/nearby_places.dart';
import 'package:hackathon/feature/real_estate/widget/contact_model_sheet.dart';
import 'package:hackathon/feature/real_estate/widget/details_images.dart';
import 'package:hackathon/feature/real_estate/widget/row_for_info_details.dart';
import 'package:hackathon/feature/real_estate/widget/services_icon_list.dart';

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
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  Image carousel (instead of stacking 3 large images)
              SizedBox(
                height: 250,
                child: PageView(
                  children:  [
                    DetailsImages(path: 'assets/images/room.png'),
                    DetailsImages(path: 'assets/images/room2.png'),
                    DetailsImages(path: 'assets/images/room3.png'),
                  ],
                ),
              ),

              // 🧾 Info Card Section
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price & details
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/riyal.png', height: 18),
                        Text(
                          " $price",
                          style: const TextStyle(
                            color: Color(0xFF2DBE62),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "/year",
                          style: TextStyle(
                            color: Color(0xFF2DBE62),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    RowForInfo(bedrooms: bedrooms, bathrooms: bathrooms),
                    const SizedBox(height: 5),

                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'SF',
                      ),
                    ),

                    const SizedBox(height: 10),

                    //  Nearby places button
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NearbyPlacesScreen(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.map_outlined,
                          color: Color(0xFFCC5805),
                          size: 16,
                        ),
                        label: const Text(
                          'Nearby places',
                          style: TextStyle(
                            color: Color(0xFFCC5805),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 📞 Contact Owner button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
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
                          backgroundColor: const Color(0xFFCC5805),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          "Contact Owner",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //  Owner info + rating
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 33,
                          backgroundColor: Colors.black12,
                          backgroundImage: AssetImage(
                            'assets/images/icons/owner.jpeg',
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Owner',
                            style: TextStyle(
                              fontFamily: 'SF',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Reviews',
                              style: TextStyle(
                                fontFamily: 'SF',
                                fontSize: 12,
                                color: Color(0xFF7A7A7A),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  index < 4 ? Icons.star : Icons.star_border,
                                  size: 12,
                                  color: const Color(0xFFFFC107),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Color(0xFFE6E6E6)),
                    const SizedBox(height: 8),

                    //  Services list
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 10,
                      runSpacing: 10,
                      children: const [
                        ServicesIcon(
                          iconPath: 'assets/images/icons/icon.jpeg',
                          label: 'Wifi',
                        ),
                        ServicesIcon(
                          iconPath: 'assets/images/icons/icon2.jpeg',
                          label: 'Kitchen',
                        ),
                        ServicesIcon(
                          iconPath: 'assets/images/icons/icon3.jpeg',
                          label: 'Washing machine',
                        ),
                        ServicesIcon(
                          iconPath: 'assets/images/icons/icon4.jpeg',
                          label: 'Security cameras',
                        ),
                        ServicesIcon(
                          iconPath: 'assets/images/icons/icon5.jpeg',
                          label: 'Elevator',
                        ),
                        ServicesIcon(
                          iconPath: 'assets/images/icons/icon6.jpeg',
                          label: 'Parking spot',
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    const Divider(height: 1, color: Color(0xFFE6E6E6)),
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
