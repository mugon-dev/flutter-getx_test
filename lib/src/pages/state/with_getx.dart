import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_test/src/pages/controller/count_controller_with_getx.dart';

class WithGetX extends StatelessWidget {
  WithGetX({Key? key}) : super(key: key);
  CountControllerWithGetX _countControllerWithGetX =
      Get.put(CountControllerWithGetX());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "GetX",
            style: TextStyle(fontSize: 50),
          ),
          GetBuilder<CountControllerWithGetX>(
            id: "first",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          GetBuilder<CountControllerWithGetX>(
            id: "second",
            builder: (controller) {
              return Text(
                "${controller.count}",
                style: TextStyle(fontSize: 50),
              );
            },
          ),
          buildRaisedButton("first"),
          buildRaisedButton("second"),
        ],
      ),
    );
  }

  Widget buildRaisedButton(String id) {
    return RaisedButton(
      onPressed: () {
        _countControllerWithGetX.increase(id);
      },
      child: Text(
        "+",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
