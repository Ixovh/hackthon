import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/feature/home/screen/home_screen.dart';

class PropertyCard extends StatelessWidget {
  /// this widget is for creating the card
  final String imageUrl;
  final String price;
  final String bedrooms;
  final String bathrooms;
  final String location;

  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 364,
      height: 268,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.12),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // for imaging
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
            child: Image.asset(
              imageUrl,
              height: 160,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // for pricing, baths and beds
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
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

                      // for bedrooms and bathrooms
                      Row(
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
                        ],
                      ),

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
                ),

                // for palce nearby
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      // TODO: redirect to real estate
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 34,
                        height: 34,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/icons/map.svg',
                            width: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),

                      Text(
                        "Nearby places",
                        style: TextStyle(
                          color: Color(0xFFCD5906),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          height: 1.1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
