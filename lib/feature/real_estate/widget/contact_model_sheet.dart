import 'package:flutter/material.dart';
import 'package:hackathon/feature/real_estate/widget/dialog_sending_message.dart';


class ContactModalBottomSheet extends StatelessWidget {
  const ContactModalBottomSheet({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    String selectedCode = '+966';
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Contact the Owner",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF',
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, size: 22, color: Colors.black87),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "Fill in the details below and the owner will get back to you soon",
              style: TextStyle(fontSize: 13, color: Color(0xFF757575), fontFamily: "SF"),
            ),
            SizedBox(height: 20),

            // name
            Text(
              "Name",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "SF"),
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.grey[500], fontFamily: "SF"),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
            SizedBox(height: 16),

            // phone
            Text(
              "Phone Number",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "SF"),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xFFE0E0E0)),
              ),
              child: Row(
                children: [
                  SizedBox(width: 8),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedCode,
                      items: [
                        DropdownMenuItem(value: '+966', child: Text('+966')),
                        DropdownMenuItem(value: '+971', child: Text('+971')),
                        DropdownMenuItem(value: '+965', child: Text('+965')),
                      ],
                      onChanged: (value) {
                        setState(() => selectedCode = value!);
                      },
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 1,
                    color: Color(0xFFE0E0E0),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Color(0xFFBDBDBD), fontFamily: 'SF'),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
            SizedBox(height: 16),

            // message
            Text(
              "Message",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: "SF"),
            ),
            SizedBox(height: 8),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Message...",
                hintStyle: TextStyle(color: Colors.grey[500], fontFamily: 'SF'),
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Send button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) =>
                        DialogSendingMessage(context: context),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00B87C),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Send",
                  style: TextStyle(
                    fontFamily: "SF",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
