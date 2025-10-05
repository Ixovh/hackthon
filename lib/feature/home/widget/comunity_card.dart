import 'package:flutter/material.dart';
import 'package:hackathon/feature/home/controller/community_post_model.dart';

class CommunityCard extends StatelessWidget {
  final CommunityPost post;

  const CommunityCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:  0.05),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Avatar + Name + Flag
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Name + Flag
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            post.name,
                            style: TextStyle(
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 4),
                        Image.asset(post.countryFlag, width: 16, height: 16),
                      ],
                    ),
                    SizedBox(height: 2),
                    Text(
                      post.timeAgo,
                      style: TextStyle(
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

          // Content
          if (post.content.contains('.'))
            RichText(
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.content,
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: ' more',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontSize: 14,
                      color: Color(0xFF2DBE62),
                    ),
                  ),
                ],
              ),
            )
          else
            Text(
              post.content,
              style: TextStyle(
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
