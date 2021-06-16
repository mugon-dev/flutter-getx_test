import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_test/src/pages/dependency/dependency_manage_page.dart';
import 'package:getx_route_test/src/pages/normal/first.dart';
import 'package:getx_route_test/src/pages/reactive_simple_state.dart';
import 'package:getx_route_test/src/pages/simple_state.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('라우트 관리 홈'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => FirstPage()));
                Get.to(() => FirstPage());
              },
              child: Text('일반적인 라우트'),
            ),
            RaisedButton(
              onPressed: () {
                // Get.toNamed('/first');
                Navigator.of(context).pushNamed('/first');
              },
              child: Text('Named 라우트'),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/next', arguments: User("name", 11));
              },
              child: Text('argument 전달'),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/user/28353');
              },
              child: Text('동적 url'),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(SimpleStatePage());
              },
              child: Text('단순 상태 관리'),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(ReactiveSimpleStatePage());
              },
              child: Text('반응 상태 관리'),
            ),
            RaisedButton(
              onPressed: () {
                Get.to(DependencyManagePage());
              },
              child: Text('의존성 관리'),
            ),
            RaisedButton(
              onPressed: () {
                Get.toNamed('/binding');
              },
              child: Text('의존성 관리'),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  int age;
  User(this.name, this.age);
}
