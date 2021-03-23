import 'package:flutter/material.dart';
import 'package:get/get.dart';

mySnackbar({required String description,required BuildContext context}) {
 final snackBar = SnackBar(
    content: Text(description),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);;
}
