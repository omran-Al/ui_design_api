// ignore_for_file: avoid_print

import 'package:api_tests/cubit_apps/cubit.dart';
import 'package:api_tests/cubit_apps/state.dart';
import 'package:api_tests/widget/article_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreens extends StatelessWidget {
  const SportsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        print('Page Sports');
        List<dynamic> list = NewCubit.get(context).sports;
        print(list.length);
        return ArticalBuldie(list);
      },
    );
  }
}
