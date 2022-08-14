import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/state2.dart';
import 'package:news_app/dio/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int selectedIndex = 0;

  bool isDark = false;
  void appMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeApp());
    } else {
      isDark = !isDark;

      CacheHelper.setValue(isDark: isDark, key: 'isDark');
      emit(AppChangeModeApp());
    }
  }

  List titles = ['Task', 'Done', 'Archive'];

  List<dynamic> newts = [];
  List<dynamic> donets = [];
  List<dynamic> archts = [];

  void changeIndex(index) {
    selectedIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  // void createDataBase() {
  //   openDatabase(
  //     'todo.db',
  //     onCreate: (db, ver) async {
  //       await db.execute(
  //           'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title Text, date Text, time Text ,status Text)');
  //     },
  //     version: 1,
  //     onOpen: (db) {
  //       getFataFromDataBase(db);
  //       print('Opened');
  //       print('$newts' + '$donets' + '$archts');
  //     },
  //   ).then((value) {
  //     db = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }

  // insertData({
  //   required String title,
  //   required String date,
  //   required String time,
  // }) async {
  //   await db
  //       .transaction(
  //     (txn) => txn.rawInsert(
  //         'INSERT INTO tasks (title,date,time,status) VALUES ("$title","$date","$time","New")'),
  //   )
  //       .then((value) {
  //     print('$value Row Inserted');
  //     emit(AppInserteDatabaseState());

  //     getFataFromDataBase(db);
  //   });
  // }

  // void getFataFromDataBase(db) {
  //   emit(AppGeteDatabaseLoadingState());

  //   newts = [];
  //   donets = [];
  //   archts = [];
  //   db.rawQuery('SELECT * FROM tasks').then((value) {
  //     emit(AppGeteDatabaseState());

  //     value.forEach((element) {
  //       if (element['status'] == 'New')
  //         newts.add(element);
  //       else if (element['status'] == 'Done')
  //         donets.add(element);
  //       else
  //         archts.add(element);
  //     });
  //   });
  // }

  // void UpdateDate({required String status, required int id}) async {
  //   // Update some record
  //   db.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?', [
  //     status,
  //     id,
  //   ]).then((value) {
  //     getFataFromDataBase(db);
  //     emit(AppUpdateeDatabaseState());
  //   });
  // }

  // void DeleteDate({required int id}) async {
  //   // Update some record
  //   db.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
  //     getFataFromDataBase(db);
  //     emit(AppDeleteDatabaseState());
  //   });
  // }

  // void changeBottomSheet({required bool isShow, required Widget icon}) {
  //   isBottomSheetShown = isShow;
  //   fabIcon = icon;

  //   emit(AppChangeBottomSheetState());
  // }
}
