import 'package:flutter/material.dart';

class CommunityController {
  late TabController tabController;
  final List<String> tabs = ["Feeds", "Event"];

  void init({required TickerProvider vsync}) {
    tabController = TabController(length: tabs.length, vsync: vsync);
  }

  void dispose() {
    tabController.dispose();
  }
}
