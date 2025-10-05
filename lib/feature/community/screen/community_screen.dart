import 'package:flutter/material.dart';
import '../controller/community_controller.dart';
import '../widget/search_filter.dart';
import '../widget/post_card.dart';
import '../widget/event_card.dart';

class CommunityScreen1 extends StatefulWidget {
  const CommunityScreen1({super.key});

  @override
  State<CommunityScreen1> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen1>
    with SingleTickerProviderStateMixin {
  final controller = CommunityController();

  @override
  void initState() {
    super.initState();
    controller.init(vsync: this); 
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Explore"),
        bottom: TabBar(
          controller: controller.tabController,
          labelColor: const Color(0xFF00AA5B),
          unselectedLabelColor: Colors.black,
          indicatorColor: const Color(0xFF00AA5B),
          indicatorWeight: 3,
          tabs: controller.tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          // =============================== Feeds Tab ==================================
          Stack(
            children: [
              Column(
                children: [
                  const SearchAndFilter(),
                  Expanded(
                    child: ListView(
                      children: const [
                        PostCard(
                          username: "James",
                          avatarPath: "assets/images/avatar1.png",
                          flagPath: "assets/images/flag1.png",
                          timeAgo: "22 min ago",
                          contentText:
                              "Can someone explain how the public transport system works in Riyadh?",
                        ),
                        PostCard(
                          username: "Krit",
                          avatarPath: "assets/images/profile2.png",
                          flagPath: "assets/images/flag.png",
                          timeAgo: "22 min ago",
                          contentText:
                              "Found this product in Carrefour, reminds me of home🤍, anyone knows where i can find more International brands? ",
                          imagePath: "assets/images/post1.png",
                        ),
                        PostCard(
                          username: "Ravi",
                          avatarPath: "assets/images/avatar3.png",
                          flagPath: "assets/images/flag3.png",
                          timeAgo: "8 h ago",
                          contentText:
                              "My first time at Boulevard Riyadh City! The light, music, and food are amazing.",
                          gridImages: [
                            "assets/images/post2-1.png",
                            "assets/images/post2-2.png",
                            "assets/images/post2-3.png",
                            "assets/images/post2-4.png",
                          ],
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                ],
              ),
              // =========================== Floating Add Button ==============================
              Positioned(
                bottom: 120,
                right: 20,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00AA5B),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),

          // ================================== Events Tab ================================
          Column(
            children: [
              const SearchAndFilter(),
              Expanded(
                child: ListView(
                  children: const [
                    EventCard(
                      imagePath: "assets/images/event1.jpg",
                      dateText: "Mon, Oct 6",
                      timeText: "4:30 - 10:30 PM",
                      locationText: "Dhahran, Ithra",
                      tagText: "3 days left",
                    ),
                    EventCard(
                      imagePath: "assets/images/event2.jpg",
                      dateText: "Mon, Oct 6",
                      timeText: "4:30 - 10:30 PM",
                      locationText: "Dhahran, Ithra",
                    ),
                    EventCard(
                      imagePath: "assets/images/event3.jpg",
                      dateText: "Mon, Oct 6",
                      timeText: "4:30 - 10:30 PM",
                      locationText: "Dhahran, Ithra",
                    ),
                    EventCard(
                      imagePath: "assets/images/event4.jpg",
                      dateText: "Mon, Oct 6",
                      timeText: "4:30 - 10:30 PM",
                      locationText: "Dhahran, Ithra",
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
