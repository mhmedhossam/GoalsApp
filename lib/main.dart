import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/Cubits/goalsCubit/goalcubit.dart';
import 'package:goals_app/screens/home_screen.dart';

void main() async {
  runApp(GoalsApp());
}

class GoalsApp extends StatelessWidget {
  const GoalsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Goals App",
      home: BlocProvider<GoalsCubit>(
        create: (context) => GoalsCubit()
          ..initialSql()
          ..getData(),
        child: HomeScreen(),
      ),
    );
  }
}
