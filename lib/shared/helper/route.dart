import 'package:flutter/material.dart';
import 'package:mqtt_example_flutter/views/home_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../models/user_model.dart';

//These methods helps to navigate from one page to another

Route createHomeScreenRoute(User user) {
  return PageTransition(
    type: PageTransitionType.rightToLeft,
    duration: const Duration(milliseconds: 500),
    child: MyHomePage(
      user: user,
    ),
  );
}
