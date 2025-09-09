import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goals_app/Cubits/goalsCubit/goalstate.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class GoalsCubit extends Cubit<Goalstate> {
  GoalsCubit() : super(InitialState());
  final addTextController = TextEditingController();

  static GoalsCubit get(context) => BlocProvider.of<GoalsCubit>(context);

  Future<void> initialSql() async {
    emit(InitialSqlLoading());
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "Goals.db");

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE Goals (id INTEGER PRIMARY KEY, name TEXT)',
        );
      },
    );
  }

  List<Map> goalslist = [];

  getData() async {
    emit(GetDataLoading());
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "Goals.db");

    Database database = await openDatabase(path);

    await database
        .rawQuery('SELECT * FROM GOALS')
        .then((value) {
          goalslist = value;
          print(" mohamedhossamyousseef------------ $goalslist");
          emit(GetDataSucceeded());
        })
        .catchError((error) {
          emit(GetDataFailure());
          print(error.toString());
        });
    database.close();
  }

  insertData(String name) async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "Goals.db");
    emit(InsertDataLoading());
    Database database = await openDatabase(path, version: 1);
    await database
        .rawInsert('INSERT INTO Goals(name) VALUES(?)', [name])
        .then((value) async {
          await getData();
          emit(InsertDataSucceeded());
        })
        .catchError((error) {
          emit(InsertDataFailure());
          print(error.toString());
        });
    database.close();
  }

  removerData(id) async {
    emit(RemoveDataLoading());

    String databasepath = await getDatabasesPath();

    String path = join(databasepath, "Goals.db");

    Database database = await openDatabase(path);

    await database
        .rawDelete('DELETE FROM Goals WHERE id = ?', [id])
        .then((value) async {
          await getData();
          emit(RemoveDataSucceeded());
        })
        .catchError((error) {
          emit(RemoveDataFailure());
          print(error.toString());
        });
    database.close();
  }
}
