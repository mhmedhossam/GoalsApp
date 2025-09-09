import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/Cubits/goalsCubit/goalcubit.dart';
import 'package:goals_app/Cubits/goalsCubit/goalstate.dart';
import 'package:goals_app/widgets/no_goals.dart';
import 'package:goals_app/widgets/second_container.dart';

// ignore: must_be_immutable
class ListViewBuildGoals extends StatelessWidget {
  const ListViewBuildGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoalsCubit, Goalstate>(
      builder: (context, state) {
        if (state is GetDataSucceeded) {
          if (GoalsCubit.get(context).goalslist.isEmpty) {
            return Expanded(child: NoGoalsYet());
          }

          return Expanded(
            child: ListView.builder(
              itemCount: GoalsCubit.get(context).goalslist.length,
              itemBuilder: (context, index) {
                return SecondContainer(
                  id: "${GoalsCubit.get(context).goalslist[index]['id']}",
                  goalName:
                      "${GoalsCubit.get(context).goalslist[index]['name']}",
                );
              },
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
