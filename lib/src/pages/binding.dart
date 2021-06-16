import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/count_conroller_with_reactive.dart';

class BindingPage extends GetView<CountControllerWithReactive> {
  const BindingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "GetX",
            style: TextStyle(fontSize: 50),
          ),
          Obx(() => Text(
                "${controller.count.value}",
                style: TextStyle(fontSize: 50),
              )),
          RaisedButton(
            onPressed: () {
              //GetView 안에 controller가 있음
              controller.increase();
            },
            child: Text(
              "+",
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }
}
