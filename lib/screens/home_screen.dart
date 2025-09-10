import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/Cubits/goalsCubit/goalcubit.dart';
import 'package:goals_app/Cubits/goalsCubit/goalstate.dart';
import 'package:goals_app/widgets/floatingaction_mainscreen.dart';
import 'package:goals_app/widgets/listviewbuild_goals.dart';
import 'package:goals_app/widgets/main_container.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.indigo[700]!, Colors.indigo[900]!],
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "My Goals",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 30,
                wordSpacing: 4,
              ),
            ),
            Text(
              "Track your progress",
              style: TextStyle(fontSize: 15, color: Colors.white70),
            ),
          ],
        ),
      ),
      body: BlocConsumer<GoalsCubit, Goalstate>(
        listener: (context, state) {
          if (state is InsertDataSucceeded) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("goal create success")));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(children: [MainContainer(), ListViewBuildGoals()]),
          );
        },
      ),
      floatingActionButton: FloatingActionButtonMainScreen(),
    );
  }
}
