import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/state2.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/dio/dio_helper.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'أعمال',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'رياضة',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'علوم',
    ),
  ];

  void changeBottomNavBar(int index) {
    if (index == 1) getSports();
    if (index == 2) getScience();
    currentIndex = index;
    emit(NewsBottomNav());
  }

  List<dynamic> busiess = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '266ae07e81a143ac800c334eded97a30',
      },
    ).then((value) {
      //print(value.data['articles']);
      busiess = value.data['articles'];
      print(busiess[0]['title']);
      emit(NewsgetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

// https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=266ae07e81a143ac800c334eded97a30

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '266ae07e81a143ac800c334eded97a30',
        },
      ).then((value) {
        //print(value.data['articles']);
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewsgetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsgetSportsSuccessState());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '266ae07e81a143ac800c334eded97a30',
        },
      ).then((value) {
        //print(value.data['articles']);
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewsgetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsgetScienceSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': value,
        'apiKey': '266ae07e81a143ac800c334eded97a30',
      },
    ).then((value) {
      //print(value.data['articles']);
      search = value.data['articles'];
      // print(search[0]['title']);
      emit(NewsgetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isAR = false;
  bool isEN = false;

  void ar() {
    isAR = true;
  }

  void en() {
    isEN = true;
  }
}



//https://newsapi.org/v2/everything?q=tesla&apiKey=266ae07e81a143ac800c334eded97a30