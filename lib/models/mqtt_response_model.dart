import 'dart:convert';

class MqttResponseModel {
  int count;
  int taskCompleted;
  int taskFailed;
  int taskInprogress;

  MqttResponseModel({
    required this.count,
    required this.taskCompleted,
    required this.taskFailed,
    required this.taskInprogress,
  });

  MqttResponseModel copyWith({
    int? count,
    int? taskCompleted,
    int? taskFailed,
    int? taskInprogress,
  }) =>
      MqttResponseModel(
        count: count ?? this.count,
        taskCompleted: taskCompleted ?? this.taskCompleted,
        taskFailed: taskFailed ?? this.taskFailed,
        taskInprogress: taskInprogress ?? this.taskInprogress,
      );
  factory MqttResponseModel.initial() {
    return MqttResponseModel(
      count: 0,
      taskCompleted: 0,
      taskFailed: 0,
      taskInprogress: 0,
    );
  }
  factory MqttResponseModel.fromRawJson(String str) =>
      MqttResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MqttResponseModel.fromJson(Map<String, dynamic> json) =>
      MqttResponseModel(
        count: json["count"] ?? 0,
        taskCompleted: json["task_completed"] ?? 0,
        taskFailed: json["task_failed"] ?? 0,
        taskInprogress: json["task_inprogress"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "task_completed": taskCompleted,
        "task_failed": taskFailed,
        "task_inprogress": taskInprogress,
      };
}
