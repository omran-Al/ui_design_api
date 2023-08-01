import 'package:api_tests/cubit_apps/cubit.dart';
import 'package:api_tests/cubit_apps/state.dart';
import 'package:api_tests/screen/news_screen.dart';
import 'package:api_tests/shared/dio/dio_apps.dart';
import 'package:api_tests/shared/dio/service_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'myblocobserver .dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioApps.init();
  await CacheHelper.initCache();
  bool? stateMode = CacheHelper.getDataCache(key: 'isDark') ?? false;
  runApp(MyApp(stateMode));
}

class MyApp extends StatelessWidget {
  bool? stat;
  MyApp(this.stat);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => NewCubit()
              ..getBussince()
              ..changeModeApps(stateApps: stat)),
        // BlocProvider(
        //     create: (context) => NewCubit()..changeModeApps(stateApps: stat)),
      ],
      child: BlocConsumer<NewCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                titleSpacing: 20.0,
                // backwardsCompatibility: false,
                actionsIconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
              ),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                bodyMedium: TextStyle(
                  fontSize: 12.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              textTheme: const TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                bodyMedium: TextStyle(
                  fontSize: 12.0,
                  //fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                // backwardsCompatibility: false,
                titleSpacing: 20.0,
                actionsIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                elevation: 0.0,
                backgroundColor: HexColor('333739'),
                titleTextStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.deepOrange,
                elevation: 20.0,
                backgroundColor: HexColor('333739'),
              ),
            ),
            themeMode:
                NewCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}
