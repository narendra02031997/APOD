import 'package:apod/core/restApis/restApi.dart';
import 'package:apod/model/ApodResponseModel.dart';
import 'package:apod/utils/extras/extras.dart';
import 'package:apod/utils/snackBar/mySnackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApodController extends GetxController {
  String title = '', description = '', image = '';
  DateTime date = DateTime.now();
  RestApi restApi = RestApi();
  var isLoading = false.obs;

  findData({required BuildContext context}) async {
    ApodResponseModel? apodResponseModel =
        await restApi.getApodData(date: getFormattedDate(date: date));

    if (apodResponseModel != null) {
      title = apodResponseModel.title;
      description = apodResponseModel.explanation;
      if (apodResponseModel.hdurl == null) {
        mySnackbar(
            description: 'Image not found on this date',
            context: context);
      } else {
        image = apodResponseModel.hdurl;
      }
      update();
      Get.back();
    } else {
      mySnackbar(
          description: 'Something went wrong please try again later',
          context: context);
    }
  }

  void selectDate(BuildContext context) async {
    DateTime picked = (await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)))!;
    if (picked != null && picked != date) date = picked;
    update();
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
