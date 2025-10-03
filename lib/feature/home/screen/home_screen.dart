import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon/feature/home/controller/home_cotroller.dart';
import 'package:hackathon/feature/home/widget/comunity_card.dart';
import 'package:hackathon/feature/home/widget/display_promocard.dart';
import 'package:hackathon/feature/home/widget/find_home.dart';
import 'package:hackathon/feature/home/widget/username.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeCotroller controller = HomeCotroller();

  @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        toolbarHeight: 100,
        titleSpacing: 0,
        backgroundColor: Colors.white,
        title: UserNamewidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 22.0),
            child: Container(
              height: 46,
              width: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFEAEAEA), width: 2),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/bell.svg',
                  width: 18,
                  height: 19.5,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 13),
            child: Text(
              'Picks For You',
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 18),
          DisplayPromoCard(controller: controller),
          SizedBox(height: 27),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Find your new home',
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 18),

                FindHome(),
              ],
            ),
          ),
          SizedBox(height: 27),

          Container(
            width: 347,
            height: 24,
            padding: EdgeInsets.only(left: 15, right: 31),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Community highlights',
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'see all',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF00AA5B),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                return CommunityCard(post: controller.posts[index]);
              },
            ),
          ),

          SizedBox(height: 47),
        ],
      ),
    );
  }
}
