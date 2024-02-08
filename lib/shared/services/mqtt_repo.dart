import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:mqtt_example_flutter/main.dart';
import 'package:provider/provider.dart';

import '../../models/mqtt_response_model.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../helper/constants.dart';

class MqttRepository {
  MqttRepository._privateConstructor();

  static final MqttRepository _instance = MqttRepository._privateConstructor();

  factory MqttRepository() {
    return _instance;
  }

  late MqttServerClient _client;

  void initializeMQTTClient() {
    _client = MqttServerClient(
        Constants.kMQTTHostName, Constants.kMQTTIdentifierPrefix)
      ..port = Constants.kMQTTPort
      ..logging(on: false)
      ..onDisconnected = _onDisconnected
      ..onSubscribed = _onSubscribed
      ..keepAlivePeriod = 20
      ..setProtocolV311()
      ..onConnected = _onConnected;
    _client.port = 1883;
    final connMess = MqttConnectMessage()
        .authenticateAs(Constants.kMQTTUserName, Constants.kMQTTPassword)
        .withClientIdentifier(Constants.kMQTTIdentifierPrefix)
        .withWillTopic('willTopic')
        .withWillMessage('willMessage')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    if (kDebugMode) {
      print('Connecting....');
    }
    _client.connectionMessage = connMess;
    connectMqtt();
    _client.updates?.listen(_handleIncomingMessage);
  }

  void connectMqtt() async {
    _client.logging(on: true);
    _client.onConnected = _onConnected;
    _client.onDisconnected = _onDisconnected;
    _client.onSubscribed = _onSubscribed;
    _client.pongCallback = _onPong;

    try {
      await _client.connect();
    } catch (e) {
      if (kDebugMode) {
        print('Exception: $e');
      }
    }
  }

  void _handleIncomingMessage(List<MqttReceivedMessage<MqttMessage>> messages) {
    for (final MqttReceivedMessage<MqttMessage> msg in messages) {
      final homeViewModel = Provider.of<HomeViewModel>(
          appNavigatorKey.currentContext!,
          listen: false);
      final MqttPublishMessage recMess = msg.payload as MqttPublishMessage;
      final String messageString =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      // Parse the message string into a JSON object
      final messageJson = jsonDecode(messageString);
      int count = messageJson['count'];
      homeViewModel.setCounter(count);
      // Create a new MqttResponseModel from the JSON object
      final mqttResponse = MqttResponseModel.fromJson(messageJson);

      // Update _mqttResponse in the HomeViewModel
      homeViewModel.setMqttResponse(mqttResponse);

      if (kDebugMode) {
        print('Received message: $messageJson');
      }
    }
  }

  void _onConnected() {
    if (kDebugMode) {
      print('Connected');
    }
    _client.subscribe('anwin/mqtt/example/topic', MqttQos.atLeastOnce);
  }

  void _onDisconnected() {
    if (kDebugMode) {
      print('Disconnected');
    }
  }

  void _onSubscribed(String topic) {
    if (kDebugMode) {
      print('Subscribed: $topic');
    }
  }

  void _onPong() {
    if (kDebugMode) {
      print('Ping response received');
    }
  }
}
