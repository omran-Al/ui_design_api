// ignore_for_file: avoid_print

import 'package:api_tests/cubit_apps/state.dart';
import 'package:api_tests/screens/bussince_screens.dart';
import 'package:api_tests/screens/sports_screen.dart';
import 'package:api_tests/screens/science_screen.dart';
import 'package:api_tests/shared/dio/dio_apps.dart';
import 'package:api_tests/shared/dio/service_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/setting_screen.dart';

class NewCubit extends Cubit<NewsState> {
  NewCubit() : super(InitlApps());

  static NewCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Text> titleApps = const [
    Text(
      'News Apps',
    ),
    Text(
      'Sport Apps',
    ),
    Text(
      'Scinces Apps',
    ),
    Text(
      'Setting Apps',
    ),
  ];

  List<Widget> screensApps = const [
    BussinceScreens(),
    SportsScreens(),
    ScienceScreens(),
    Settingcreens(),
  ];

  List<BottomNavigationBarItem> bottemItems = [
    iconApps(
      labels: 'Business',
      iconData: Icons.business,
    ),
    iconApps(
      labels: 'Sports',
      iconData: Icons.sports,
    ),
    iconApps(
      labels: 'Scinces',
      iconData: Icons.science,
    ),
    iconApps(
      labels: 'Setting',
      iconData: Icons.settings,
    )
  ];

  void changeBottem(int index) {
    currentIndex = index;
    if (index == 1) getSports();
    if (index == 2) getScience();
    emit(ChangeBottemPar());
  }

  List<dynamic> bussince = [];

  void getBussince() {
    emit(GetBussinceLoading());
    if (bussince.isEmpty) {
      DioApps.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '5649968ceb9e4f3fa1812c95ea6d3a54',
      }).then((value) {
        bussince = value.data['articles'];
        print('ddddddddddddddddddddddddddddddddddddddddd');
        print(bussince.length);
        emit(GetBussinceDatag());
      }).catchError((onError) {
        print('Errors : ${onError.toString()}');
        emit(GetBussinceErrors(onError));
      });
    } else {
      emit(GetBussincesuccess());
    }
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(GetSportsLoading());
    if (sports.isEmpty) {
      DioApps.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '5649968ceb9e4f3fa1812c95ea6d3a54',
      }).then((value) {
        sports = value.data['articles'];
        // print(value.data['articles'][0]['title']);
        print(sports.length);
        emit(GetSportsDatag());
      }).catchError((onError) {
        print('Errors : ${onError.toString()}');
        emit(GetSportsErrors(onError));
      });
    } else {
      emit(GetSportssuccess());
    }
  }

  List<dynamic> science = [];

  void getScience() {
    emit(GetScienceLoading());
    if (science.isEmpty) {
      DioApps.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '5649968ceb9e4f3fa1812c95ea6d3a54',
      }).then((value) {
        science = value.data['articles'];
        // print(value.data['articles'][0]['title']);
        print(science.length);
        emit(GetScienceDatag());
      }).catchError((onError) {
        print('Errors : ${onError.toString()}');
        emit(GetScienceErrors(onError));
      });
    } else {
      emit(GetBussincesuccess());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(GetSearchLoading());
    search = [];

    DioApps.getData(url: 'v2/everything', query: {
      // 'country': 'eg',
      'q': '$value',
      'apiKey': '5649968ceb9e4f3fa1812c95ea6d3a54',
    }).then((value) {
      search = value.data['articles'];
      // print(value.data['articles'][0]['title']);
      print(science.length);
      emit(GetSearchSuccess());
    }).catchError((onError) {
      print('Errors : ${onError.toString()}');
      emit(GetScienceErrors(onError));
    });
  }

  bool isDark = false;

  ThemeMode themeMode = ThemeMode.dark;

  void changeModeApps({bool? stateApps}) {
    if (stateApps == null) {
      isDark = stateApps!;
    } else {
      isDark = !isDark;
      CacheHelper.putDataCache(key: 'isDark', value: isDark).then((value) {
        emit(ChingeModeApps());
      });
    }
  }
}

BottomNavigationBarItem iconApps({
  required String? labels,
  required IconData iconData,
}) =>
    BottomNavigationBarItem(label: labels, icon: Icon(iconData));
