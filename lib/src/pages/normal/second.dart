import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_test/src/home.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Get.back();
                },
                child: Text('뒤로 이동'),
              ),
              RaisedButton(
                onPressed: () {
                  Get.to(Home());
                  //이전 히스토리 삭제
                  Get.offAll(Home());
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(builder: (_) => Home()),
                  //     (route) => false);
                },
                child: Text('홈으로 이동'),
              )
            ],
          ),
        ));
  }
}
