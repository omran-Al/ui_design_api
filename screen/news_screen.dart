// import 'package:api_test/ervices/service_apps.dart';

import 'package:api_tests/content/content_apps.dart';
import 'package:api_tests/cubit_apps/cubit.dart';
import 'package:api_tests/cubit_apps/state.dart';
import 'package:api_tests/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: cubit.titleApps[cubit.currentIndex],
            actions: [
              IconButton(
                  onPressed: () {
                    print('sssssssssssssssssssssssssssssssssss');

                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changeModeApps(stateApps: cubit.isDark);
                  },
                  icon: const Icon(Icons.brightness_4_rounded)),
            ],
          ),
          body: cubit.screensApps[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items: cubit.bottemItems,
            onTap: (index) {
              cubit.changeBottem(index);
            },
          ),
        );
      },
    );
  }
}
