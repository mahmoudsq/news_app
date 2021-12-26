import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/medules/business/business_screen.dart';
import 'package:newsapp/medules/science/science_screen.dart';
import 'package:newsapp/medules/setting/setting_screen.dart';
import 'package:newsapp/medules/sports/sports_screen.dart';
import 'package:newsapp/shared/components/constants.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    if(index == 1) {
      getSports();
    }
    if(index == 2) {
      getSciences();
    }
    emit(AppChangeBottomNavigationBarState());
  }

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_basketball), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
    //BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    //SettingsScreen()
  ];

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
            url: 'v2/top-headlines',
            query: {'country': 'eg', 'category': 'business', 'apiKey': apiKey})
        .then((value) {
      business = value.data['articles'];
      debugPrint(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(NewsGetBusinessErrorState(e.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {'country': 'eg', 'category': 'sports', 'apiKey': apiKey})
          .then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportsSuccessState());
      }).catchError((e) {
        debugPrint(e.toString());
        emit(NewsGetSportsErrorState(e.toString()));
      });
    }else{
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> sciences = [];

  void getSciences() {
    emit(NewsGetScienceLoadingState());
    if(sciences.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {'country': 'eg', 'category': 'science', 'apiKey': apiKey})
          .then((value) {
        sciences = value.data['articles'];
        emit(NewsGetScienceSuccessState());
      }).catchError((e) {
        debugPrint(e.toString());
        emit(NewsGetScienceErrorState(e.toString()));
      });
    }else{
      emit(NewsGetScienceSuccessState());
    }

  }

  List<dynamic> search = [];

  void getSearch(String value) {

    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getData(
        url: 'v2/everything',
        query: { 'q': value, 'apiKey': apiKey})
        .then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(NewsGetSearchErrorState(e.toString()));
    });

  }

  bool isDark = false;

  void changeAppMode(){
    isDark = !isDark;
    debugPrint(isDark.toString());
    emit(NewsChangeModeState());
  }
}
