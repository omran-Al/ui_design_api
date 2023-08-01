import 'package:api_tests/cubit_apps/cubit.dart';
import 'package:api_tests/cubit_apps/state.dart';
import 'package:api_tests/widget/article_builder.dart';
import 'package:api_tests/widget/text_filead.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  // const SearchScreen({super.key});
  var dataSearch = TextEditingController();
  var state1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<dynamic> items = NewCubit.get(context).search;
        return Form(
          key: state1,
          child: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormFileadApps(
                    inPutData: dataSearch,
                    textInputType: TextInputType.text,
                    labelText: 'Search Apps',
                    prefixIcon: Icons.search,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Pleas Enetr Value For Search';
                      }
                      return null;
                    },
                    onChange: (value) {
                      if (state1.currentState!.validate()) {
                        NewCubit.get(context).getSearch(value);
                      }
                    },
                  ),
                ),
                const SizedBox(height: 25.0),
                Expanded(
                    child: ArticalBuldie(
                  items,
                  isSearch: true,
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
