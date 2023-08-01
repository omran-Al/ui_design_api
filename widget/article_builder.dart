import 'package:api_tests/content/content_apps.dart';
import 'package:api_tests/widget/build_items.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

class ArticalBuldie extends StatelessWidget {
  List<dynamic> items;
  bool isSearch;
  ArticalBuldie(
    this.items, {
    this.isSearch = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: items.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => BuiledItems(items[index]),
        separatorBuilder: (context, index) => myDrive(),
        itemCount: items.length,
      ),
      fallback: (context) => isSearch
          ? Container()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
