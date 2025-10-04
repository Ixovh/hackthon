import 'package:flutter/material.dart';

class RealEstateController {
  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        List<String> selectedTypes = [];
        String selectedRooms = "";
        String selectedBaths = "";
        double minArea = 800;
        double maxArea = 1000;
        double minPrice = 20000;
        double maxPrice = 80000;

        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 70,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Set Filters",
                        style: TextStyle(
                          fontFamily: 'SF',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),

                    Text(
                      "Property Type",
                      style: TextStyle(
                        fontFamily: "SF",
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (var type in [
                          "House",
                          "Apartment",
                          "Own",
                          "Rental",
                          "Annual",
                          "Monthly",
                          "Furnished",
                          "Unfurnished",
                        ])
                          FilterChip(
                            label: Text(type),
                            selected: selectedTypes.contains(type),
                            selectedColor: Color(
                              0xFF2DBE62,
                            ).withValues(alpha: 0.15),
                            checkmarkColor: Color(0xFF2DBE62),
                            side: BorderSide(color: Color(0xFF2DBE62)),
                            onSelected: (value) {
                              setState(() {
                                if (value) {
                                  selectedTypes.add(type);
                                } else {
                                  selectedTypes.remove(type);
                                }
                              });
                            },
                          ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // room selcetion
                    Text(
                      "Rooms",
                      style: TextStyle(
                        fontFamily: "SF",
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      children: ["1", "2", "3", "4", "5", "Any"].map((value) {
                        final isSelected = selectedRooms == value;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedRooms = value;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFF2DBE62).withValues(alpha: 0.1)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? Color(0xFF2DBE62)
                                    : Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              value,
                              style: TextStyle(
                                color: isSelected
                                    ? Color(0xFF2DBE62)
                                    : Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),

                    //  bath room selcetion
                    Text(
                      "BathRoom",
                      style: TextStyle(
                        fontFamily: "SF",
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      children: ["1", "2", "3", "4", "5", "Any"].map((value) {
                        final isSelected = selectedBaths == value;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedBaths = value;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Color(0xFF2DBE62).withValues(alpha: 0.1)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? Color(0xFF2DBE62)
                                    : Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Text(
                              value,
                              style: TextStyle(
                                color: isSelected
                                    ? Color(0xFF2DBE62)
                                    : Colors.black,
                                fontWeight: FontWeight.w600,
                                fontFamily: "SF",
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 25),

                    //  area slider
                    Text(
                      "Area",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: "SF",
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 10),
                    RangeSlider(
                      min: 800,
                      max: 1000,
                      divisions: 10,
                      activeColor: Color(0xFF2DBE62),
                      values: RangeValues(minArea, maxArea),
                      onChanged: (values) {
                        setState(() {
                          minArea = values.start;
                          maxArea = values.end;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${minArea.toInt()} ft²",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "SF",
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "${maxArea.toInt()} ft²",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "SF",
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // price range
                    Text(
                      "Pricerange",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: "SF",
                      ),
                    ),
                    SizedBox(height: 10),
                    RangeSlider(
                      min: 20000,
                      max: 100000,
                      divisions: 10,
                      activeColor: Color(0xFF2DBE62),
                      values: RangeValues(minPrice, maxPrice),
                      onChanged: (values) {
                        setState(() {
                          minPrice = values.start;
                          maxPrice = values.end;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "﷼ ${minPrice.toInt()}",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "SF",
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "﷼ ${maxPrice.toInt()}",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "SF",
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),

                    // Apply Filters button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);

                        debugPrint("Selected Types: $selectedTypes");
                        debugPrint("Rooms: $selectedRooms");
                        debugPrint("Baths: $selectedBaths");
                        debugPrint(
                          "Area: $minArea - $maxArea | Price: $minPrice - $maxPrice",
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55),
                        backgroundColor: Color(0xFF2DBE62),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Apply Filters",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
