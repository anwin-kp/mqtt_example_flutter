import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const Size kGlobalSize = Size(360, 690);

  //! MQTT Data Constants
  static const int kMQTTWaitTimeInSecond = 5;
  static const String kMQTTHostName = 'broker.emqx.io';
  static const int kMQTTPort = 1883;
  static const String kMQTTUserName = 'anwin_kp_11';
  static const String kMQTTPassword = '123456';
  static const String kMQTTIdentifierPrefix = 'mqttx_cb7c781a-';

  //! Common Constants
  static const String mqttDataUpdatedSuccessText = 'Data Updated Successfully';
  static const String updateCapsText = 'UPDATE';
  static const String taskInProgressText = 'task_inprogress';
  static const String taskFailedText = 'task_failed';
  static const String taskCompletedText = 'task_completed';
  static const String countText = 'count';
  static const String messageText = 'message';
}
