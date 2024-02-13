import 'package:flutter/material.dart';
import 'package:mqtt_example_flutter/views/home_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../views/data_editing_screen.dart';

//These methods helps to navigate from one page to another

Route createHomeScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 1500),
    child: const MyHomePage(),
  );
}

Route createEditScreenRoute() {
  return PageTransition(
    type: PageTransitionType.scale,
    alignment: Alignment.center,
    duration: const Duration(milliseconds: 1500),
    child: const DataEditingPage(),
  );
}
