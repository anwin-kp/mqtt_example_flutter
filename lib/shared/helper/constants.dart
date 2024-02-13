import 'package:flutter/material.dart';

class Constants {
  Constants._();
  static const Size kGlobalSize = Size(360, 690);
  static const String appTitleText = 'Flutter MQTT Demo';
  static const String homeTitleText = 'Flutter MQTT';
  static const String fontFamilyText = 'Roboto';

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
  static const String taskCompletedCapsText = 'Task Completed';
  static const String minsAgoText = 'mins ago';
  static const String hourAgoText = 'hour ago';
  static const String taskFailedCapsText = 'Task Failed';
  static const String taskInProgressCapsText = 'Task In Progress';
  static const String recentActivityText = 'Recent Activity';
  static const String statusText = 'Status';
  static const String incrementText = 'Increment';
  static const String dataEditingText = 'Data Editing';
  static const String appMqttMessageText = 'Hello, MQTT! Update From Flutter App';
  static const String updatesStatusCountText = 'You have updated the status this many times:';

  //! Error Texts
  static const String fieldCantBeEmptyText = 'This field can\'t be empty';
}
