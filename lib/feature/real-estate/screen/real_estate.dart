import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/feature/home/screen/home_screen.dart';
import 'package:hackathon/feature/real-estate/controller/real_estate_controller.dart';
import 'package:hackathon/feature/real-estate/widget/property_card.dart';

class RealEstate extends StatefulWidget {
  const RealEstate({super.key});

  @override
  State<RealEstate> createState() => _RealEstateState();
}

class _RealEstateState extends State<RealEstate> {
  RealEstateController controller = RealEstateController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.left_chevron, size: 32),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: Text(
          'Residential',
          style: TextStyle(
            fontFamily: 'SF',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 13.0, right: 18),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchBar(
                      padding: WidgetStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 13),
                      ),
                      leading: Icon(CupertinoIcons.search, size: 24),
                      hintText: "Search",
                      hintStyle: WidgetStateProperty.all(
                        TextStyle(
                          color: Color(0xFF848484),
                          fontSize: 12,
                          fontFamily: 'SF',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      elevation: WidgetStateProperty.all(0),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () => controller.showFilterBottomSheet(context),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2DBE62),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: SvgPicture.asset('assets/icons/tdashes.svg'),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              PropertyCard(
                imageUrl: 'assets/images/estate.png',
                price: '30,000',
                location: 'Riyadh, Al Narjis',
                bedrooms: '2',
                bathrooms: '1',
              ),
              PropertyCard(
                imageUrl: 'assets/images/estate2.png',
                price: '40,000',
                location: 'Riyadh, Al Yasmeen',
                bedrooms: '3',
                bathrooms: '2',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
