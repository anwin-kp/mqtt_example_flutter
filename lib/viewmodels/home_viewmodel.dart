import 'package:flutter/material.dart';
import 'package:mqtt_example_flutter/main.dart';
import 'package:mqtt_example_flutter/models/mqtt_response_model.dart';

import '../models/user_model.dart';
import '../shared/helper/app_images.dart';
import '../shared/helper/constants.dart';
import '../shared/helper/route.dart';
import '../shared/helper/utility.dart';
import '../shared/services/mqtt_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final Utility _utility = Utility();
  User user = User(
      name: "Alexander",
      email: "Alexander@gmail.com",
      imageUrl: AppImages.userImage);
  bool _loading = false;
  int _counter = 0;
  late MqttResponseModel _mqttResponse;

  MqttResponseModel get mqttResponse => _mqttResponse;
  bool get loading => _loading;
  int get counter => _counter;
  late MqttRepository _mqttRepository;

  HomeViewModel() {
    _mqttResponse = MqttResponseModel.initial();
    _mqttRepository = MqttRepository();
  }
  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setMqttResponse(MqttResponseModel value) {
    _mqttResponse = value;
    notifyListeners();
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void setCounter(int value) {
    _counter = value;
    notifyListeners();
  }

  void publishMqttMessage(Map<String, dynamic> message) {
    _mqttRepository.publishMessage(message);

    Navigator.of(appNavigatorKey.currentContext!).pushAndRemoveUntil(
      createHomeScreenRoute(),
      (Route<dynamic> route) => false,
    );
    _utility.showDoneFlushbar(
        Constants.mqttDataUpdatedSuccessText, appNavigatorKey.currentContext!);
  }
}
