import 'package:api_tests/cubit_apps/cubit.dart';
import 'package:api_tests/cubit_apps/state.dart';
import 'package:api_tests/widget/article_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BussinceScreens extends StatelessWidget {
  const BussinceScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        // ignore: avoid_print
        print('Page Bussince');
        List<dynamic> list = NewCubit.get(context).bussince;

        // ignore: avoid_print
        print(list.length);
        return ArticalBuldie(list);
      },
    );
  }
}
