import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${Get.arguments.toString()}"),
              RaisedButton(
                onPressed: () {},
                child: Text('다음페이지 이동'),
              )
            ],
          ),
        ));
  }
}
