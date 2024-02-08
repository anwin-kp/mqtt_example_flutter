import 'package:flutter/material.dart';
import 'package:mqtt_example_flutter/models/mqtt_response_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool _loading = false;
  int _counter = 0;
  late MqttResponseModel _mqttResponse;

  MqttResponseModel get mqttResponse => _mqttResponse;
  bool get loading => _loading;
  int get counter => _counter;

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
}
