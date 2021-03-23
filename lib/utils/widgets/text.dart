import 'package:flutter/material.dart';

Widget myText({String? text, double size = 17}) {
  return Text(
    text!,
    style: TextStyle(
      fontSize: size,
      color: const Color(0xffffffff),
      fontWeight: FontWeight.w700,
    ),
    textAlign: TextAlign.left,
  );
}