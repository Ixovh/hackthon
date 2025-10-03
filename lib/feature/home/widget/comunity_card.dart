import 'package:flutter/material.dart';
import 'package:hackathon/feature/home/controller/community_post_model.dart';

class CommunityCard extends StatelessWidget {
  final CommunityPost post;

  const CommunityCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset:  Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(post.avatar),
              ),
               SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          post.name,
                          style:  TextStyle(
                            fontFamily: 'SF',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                         SizedBox(width: 4),
                        Image.asset(post.countryFlag, width: 18, height: 18),
                      ],
                    ),
                    Text(
                      post.timeAgo,
                      style:  TextStyle(
                        fontFamily: 'SF',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

           SizedBox(height: 10),


          Text(
            post.content,
            style:  TextStyle(
              fontFamily: 'SF',
              fontSize: 14,
              color: Colors.black,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
