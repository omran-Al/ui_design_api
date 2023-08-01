import 'package:flutter/material.dart';

// Widget builedItems(articles) =>

Widget myDrive() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 1,
        width: double.infinity,
        color: Colors.grey[200],
      ),
    );

void navigateTo(context, Widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );
