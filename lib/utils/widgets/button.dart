import 'package:flutter/material.dart';

Widget button({String? text}) {
  return Container(
    height: 50,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(203.0),
      gradient: LinearGradient(
        begin: Alignment(0.0, -1.0),
        end: Alignment(0.0, 1.0),
        colors: [const Color(0xb5292850), const Color(0xff808080)],
        stops: [0.0, 1.0],
      ),
    ),
    child: Center(
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 17,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.left,
      ),
    ),
  );
}