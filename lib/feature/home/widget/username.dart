import 'package:flutter/material.dart';

class UserNamewidget extends StatelessWidget {
  /// this widget use for displaying username
  const UserNamewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
          SizedBox(width: 12),

          RichText(
            text: TextSpan(
              text: 'Good Morning,',
              style: TextStyle(
                fontFamily: 'SF',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "\nVikram!",
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
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
