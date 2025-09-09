import 'package:flutter/material.dart';
import 'package:goals_app/Cubits/goalsCubit/goalcubit.dart';
import 'package:goals_app/constaints.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.indigo[100]!, Colors.indigo[50]!],
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),

              child: Icon(Icons.track_changes, color: Colors.white),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${GoalsCubit.get(context).goalslist.length} Goals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "keep pushing forward!",
                    style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
