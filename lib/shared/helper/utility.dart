import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants.dart';

class Utility {
  Utility();
  String? validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return Constants.fieldCantBeEmptyText;
    }
    return null;
  }

  //FlushBar to show successful messages
  Flushbar showDoneFlushbar(String textToShow, BuildContext context) {
    return Flushbar(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      borderRadius: BorderRadius.circular(10),
      flushbarPosition: FlushbarPosition.TOP,
      messageText: Text(
        textToShow,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      icon: const Icon(
        Icons.done_all_outlined,
        size: 28.0,
        color: Colors.green,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.black54.withBlue(50),
      borderColor: Colors.lightGreen,
      borderWidth: 1,
    )..show(context);
  }
}
