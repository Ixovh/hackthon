import 'package:flutter/material.dart';
import 'package:hackathon/feature/real_estate/screen/real_estate.dart';


class DialogSendingMessage extends StatelessWidget {
  const DialogSendingMessage({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black87),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(height: 8),
            CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFF00B87C),
              child: Icon(Icons.check, size: 56, color: Colors.white),
            ),
            SizedBox(height: 24),
            Text(
              "Message Sent Successfully",
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 6),
            Text(
              "The Owner will contact you soon",
              style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontFamily: "SF"),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RealEstate()),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00B87C),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Ok",
                  style: TextStyle(
                    fontFamily: "SF",
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
