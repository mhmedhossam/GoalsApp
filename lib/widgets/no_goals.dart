import 'package:flutter/material.dart';

class NoGoalsYet extends StatelessWidget {
  const NoGoalsYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromARGB(255, 216, 221, 248),
          minRadius: 60,
          child: Icon(
            Icons.flag_outlined,
            size: 70,
            color: Color.fromARGB(255, 143, 155, 228),
          ),
        ),
        SizedBox(height: 10),

        Text(
          "No Goals Yet",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Tap the + button to add your first goal",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
