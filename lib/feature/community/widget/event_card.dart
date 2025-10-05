import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imagePath;
  final String dateText;
  final String timeText;
  final String locationText;
  final String? tagText;

  const EventCard({
    super.key,
    required this.imagePath,
    required this.dateText,
    required this.timeText,
    required this.locationText,
    this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 166,
                  width: 361,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Container(
                  height: 166,
                  width: 361,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  height: 39,
                  width: 39,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      115,
                      115,
                      115,
                    ).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),

              if (tagText != null)
                Positioned(
                  top: 5,
                  right: -7,
                  child: Container(
                    width: 80,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: Color(0xFF00AA5B)),
                    child: Text(
                      tagText!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(12, 10, 12, 0),
            child: Text(
              "Passport to the world",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/CalendarBlank.png",
                      color: const Color(0xFF00AA5B),
                      height: 16,
                      width: 15,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      dateText,
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/Clock.png",
                      color: const Color(0xFF00AA5B),
                      height: 16,
                      width: 15,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      timeText,
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/map.png",
                      color: const Color(0xFF00AA5B),
                      height: 16,
                      width: 13,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      locationText,
                      style: const TextStyle(fontSize: 13, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
