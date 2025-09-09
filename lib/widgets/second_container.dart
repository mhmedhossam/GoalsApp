import 'package:flutter/material.dart';
import 'package:goals_app/Cubits/goalsCubit/goalcubit.dart';
import 'package:goals_app/constaints.dart';

class SecondContainer extends StatelessWidget {
  dynamic id;
  dynamic goalName;

  SecondContainer({super.key, required this.id, required this.goalName});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.all(10),

        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(18),

          gradient: LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomLeft,
            colors: [Colors.indigo[400]!, ?primaryColor],
          ),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                height: 50,
                width: 50,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(121, 134, 202, 255),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),

                child: Icon(Icons.flag, color: Colors.white),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " goal #$id",
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                    ),
                    Text(
                      goalName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Spacer(flex: 1),
            Container(
              margin: EdgeInsets.all(10),
              height: 40,
              width: 40,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color.fromARGB(121, 134, 202, 255),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),

              child: IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () => showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) {
                    return Dialog(
                      backgroundColor: Color(0xffe1e4f3),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              height: 70,

                              decoration: BoxDecoration(
                                // border: Border.all(width: 0),
                                borderRadius: BorderRadius.circular(20),

                                color: Colors.red[50]!,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),

                                  Container(
                                    padding: EdgeInsets.all(7),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Manage Goal",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      Text(
                                        "what would you like to do",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 70,

                              decoration: BoxDecoration(
                                // border: Border.all(width: 0),
                                borderRadius: BorderRadius.circular(20),

                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 20),

                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),

                                    child: Text(
                                      "$id",

                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Text(
                                      goalName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.grey[600],
                                      fixedSize: Size(50, 50),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(50, 50),

                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(10),
                                      ),
                                    ),
                                    onPressed: () {
                                      GoalsCubit.get(context).removerData(id);
                                      GoalsCubit.get(context).getData();
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.delete_forever_outlined),
                                        Text("Remove"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
