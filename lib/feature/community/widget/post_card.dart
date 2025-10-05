import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String avatarPath;
  final String flagPath;
  final String timeAgo;
  final String contentText;
  final String? imagePath;
  final List<String>? gridImages;

  const PostCard({
    super.key,
    required this.username,
    required this.avatarPath,
    required this.flagPath,
    required this.timeAgo,
    required this.contentText,
    this.imagePath,
    this.gridImages,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          // header
          Row(
            children: [
              CircleAvatar(radius: 25, backgroundImage: AssetImage(avatarPath)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 6),
                        CircleAvatar(
                          radius: 10,
                          backgroundImage: AssetImage(flagPath),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeAgo,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey, size: 17),
            ],
          ),

          const SizedBox(height: 12),
          Text(
            contentText,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.start,
          ),

          if (imagePath != null) ...[
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: Image.asset(
                imagePath!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ],

          if (gridImages != null && gridImages!.isNotEmpty) ...[
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: gridImages!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                childAspectRatio: 1.6,
              ),
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.asset(gridImages![index], fit: BoxFit.cover),
              ),
            ),
          ],

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.remove_red_eye_outlined,
                size: 20,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              const Text("1924", style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 16),
              Image.asset(
                "assets/images/ChatCircle.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
              const SizedBox(width: 4),
              const Text("12", style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 16),
              Image.asset(
                "assets/images/ShareFat.png",
                width: 20,
                height: 20,
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
