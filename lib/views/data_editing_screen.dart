import 'package:flutter/material.dart';
import 'package:mqtt_example_flutter/viewmodels/home_viewmodel.dart';
import 'package:provider/provider.dart';

import '../shared/helper/constants.dart';
import '../shared/helper/utility.dart';
import '../widgets/common_edit_textfield.dart';
import '../widgets/gradient_button.dart';

class DataEditingPage extends StatefulWidget {
  const DataEditingPage({Key? key}) : super(key: key);

  @override
  State<DataEditingPage> createState() => _DataEditingPageState();
}

class _DataEditingPageState extends State<DataEditingPage> {
  final Utility _utility = Utility();
  final TextEditingController _taskCompletedController =
      TextEditingController();
  final TextEditingController _taskFailedController = TextEditingController();
  final TextEditingController _taskInProgressController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text(
              Constants.dataEditingText,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
                fontFamily: Constants.fontFamilyText,
                letterSpacing: 1.5,
              ),
            ),
          ),
          body: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        Constants.dataEditingText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: _taskInProgressController,
                        labelText: Constants.taskInProgressCapsText,
                        hintText: homeViewModel.mqttResponse.taskInprogress
                            .toString(),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: _taskCompletedController,
                        labelText: Constants.taskCompletedCapsText,
                        hintText:
                            homeViewModel.mqttResponse.taskCompleted.toString(),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: _taskFailedController,
                        labelText: Constants.taskFailedCapsText,
                        hintText:
                            homeViewModel.mqttResponse.taskFailed.toString(),
                      ),
                      const SizedBox(height: 15),
                      GradientElevatedButton(
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (_utility.validateInput(
                                      _taskCompletedController.text) ==
                                  null &&
                              _utility.validateInput(
                                      _taskFailedController.text) ==
                                  null &&
                              _utility.validateInput(
                                      _taskInProgressController.text) ==
                                  null) {
                            homeViewModel.publishMqttMessage({
                              Constants.countText: homeViewModel.counter + 1,
                              Constants.taskCompletedText:
                                  int.parse(_taskCompletedController.text),
                              Constants.taskFailedText:
                                  int.parse(_taskFailedController.text),
                              Constants.taskInProgressText:
                                  int.parse(_taskInProgressController.text),
                              Constants.messageText:
                                  Constants.appMqttMessageText,
                            });
                          }
                        },
                        child: const Text(
                          Constants.updateCapsText,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(5.0, 4.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
