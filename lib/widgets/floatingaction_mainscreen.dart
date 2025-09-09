import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/Cubits/goalsCubit/goalcubit.dart';
import 'package:goals_app/constaints.dart';

class FloatingActionButtonMainScreen extends StatelessWidget {
  const FloatingActionButtonMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: primaryColor!.withOpacity(0.4),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton.extended(
        label: Text("Add Goals"),
        icon: Icon(Icons.add),
        elevation: 5,

        onPressed: () {
          showDialog(
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

                          color: Colors.indigo[50]!,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 20),

                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12),
                              ),

                              child: Icon(Icons.add_task, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Add New Goal",
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: GoalsCubit.get(context).addTextController,
                        decoration: InputDecoration(
                          hintText: "what do you want to achieve ?",
                          filled: true,
                          prefixIconColor: Colors.grey[400],

                          prefixIcon: Icon(Icons.edit_outlined),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600,
                          ),
                          fillColor: Colors.grey[50],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              color: primaryColor!,
                              width: 2,
                            ),
                          ),
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
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
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

                                backgroundColor: primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    10,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (GoalsCubit.get(
                                  context,
                                ).addTextController.text.trim().isNotEmpty) {
                                  GoalsCubit.get(context).insertData(
                                    GoalsCubit.get(
                                      context,
                                    ).addTextController.text.trim(),
                                  );
                                  GoalsCubit.get(
                                    context,
                                  ).addTextController.text = "";
                                  GoalsCubit.get(context).getData();

                                  Navigator.pop(context);
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [Icon(Icons.add), Text("Add Goal")],
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
          );
        },
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        // child: Text("Add Goal"),
      ),
    );
  }
}
