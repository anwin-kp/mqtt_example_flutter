import 'package:flutter/material.dart';
import 'package:mqtt_example_flutter/shared/helper/route.dart';
import 'package:provider/provider.dart';

import '../shared/services/mqtt_repo.dart';
import '../viewmodels/dependency_change_view_model.dart';
import '../viewmodels/home_viewmodel.dart';
import '../widgets/custom_appbars.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MqttRepository().initializeMQTTClient();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeViewModel, LifecycleHandler>(
      builder: (context, homeViewModel, lifecycleHandler, child) {
        return Scaffold(
          appBar: CustomAppBar(
            title: "Flutter MQTT",
            onActionPressed: () {
              Navigator.push(
                context,
                createEditScreenRoute(),
              );
            },
          ),
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage(homeViewModel.user.imageUrl),
                          radius: 50,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          homeViewModel.user.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          homeViewModel.user.email,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Status',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'You have updated the status this many times:',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.grey[600]),
                        ),
                        Text(
                          homeViewModel.counter.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Recent Activity',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[200],
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Row(
                                      children: <Widget>[
                                        Icon(Icons.check, color: Colors.green),
                                        SizedBox(width: 10),
                                        Text('Task Completed'),
                                      ],
                                    ),
                                    Text(
                                        '${homeViewModel.mqttResponse.taskCompleted} mins ago'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Row(
                                      children: <Widget>[
                                        Icon(Icons.error, color: Colors.red),
                                        SizedBox(width: 10),
                                        Text('Task Failed'),
                                      ],
                                    ),
                                    Text(
                                        '${homeViewModel.mqttResponse.taskFailed} mins ago'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Row(
                                      children: <Widget>[
                                        Icon(Icons.warning,
                                            color: Colors.yellow),
                                        SizedBox(width: 10),
                                        Text('Task In Progress'),
                                      ],
                                    ),
                                    Text(
                                        '${homeViewModel.mqttResponse.taskInprogress} hour ago'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              homeViewModel.incrementCounter();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
