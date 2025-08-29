import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final String userName = "Anthony Bankah";
    final String userEmail = "anthony@example.com";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //
        Text(
          "ToDoPro",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700,
          ),
        ),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.blue.shade700,
                  ),
                ),
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),

            //
            const CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ],
        ),
      ],
    );
  }
}
