import 'package:apod/controllers/apodController.dart';
import 'package:apod/utils/extras/extras.dart';
import 'package:apod/utils/snackBar/mySnackbar.dart';
import 'package:apod/utils/strings/strings.dart';
import 'package:apod/utils/widgets/button.dart';
import 'package:apod/utils/widgets/text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class APOD extends StatefulWidget {
  @override
  _APODState createState() => _APODState();
}

class _APODState extends State<APOD> {
  ApodController controller = Get.put(ApodController());
@override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.findData(context: context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ApodController>(
        builder: (controller) {
          return controller.image==''?Center(child: CupertinoActivityIndicator(radius: 20,)):Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      controller.image==null?DEFAULT_IMAGE:controller.image,
                    ))),
            child:
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    myText(text: controller.title, size: 25),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: myText(
                        text: controller.description,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                getFormattedDate(date: controller.date),
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color(0xffc6c6c6),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            InkWell(
                                onTap: (){
                                  controller.selectDate(context);
                                },
                                child: button(text: 'Select Date')),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                           controller.showAlertDialog(context);
                              controller.findData(context: context);
                            },
                            child: button(text: 'Find'))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
