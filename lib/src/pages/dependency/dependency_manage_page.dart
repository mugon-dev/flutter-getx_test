import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_route_test/src/pages/controller/dependency_controller.dart';
import 'package:getx_route_test/src/pages/dependency/get_lazyput.dart';
import 'package:getx_route_test/src/pages/dependency/get_put.dart';

class DependencyManagePage extends StatelessWidget {
  const DependencyManagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('의존성 주입'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text("GetPut"),
              onPressed: () {
                //바인딩 : 페이지로 보내주면서 사용할 컨트롤러를 주입하는 방법
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder(() {
                    Get.put(DependencyController());
                    //put방식은 페이지 이동시 controller를 메모리에 올려주고 나올땐 알아서 삭제해줌
                  }),
                );
              },
            ),
            RaisedButton(
              child: Text("Get.lazyPut"),
              onPressed: () {
                Get.to(
                  GetLazyPut(),
                  binding: BindingsBuilder(() {
                    // controller를 사용할때 메모리에 올려줌
                    // 나올땐 삭제
                    Get.lazyPut<DependencyController>(
                        () => DependencyController());
                  }),
                );
              },
            ),
            RaisedButton(
              child: Text("Get.putAsync"),
              onPressed: () {
                Get.to(
                  GetPut(),
                  binding: BindingsBuilder(() {
                    // 페이지에 접근을 할때 비동기식으로 데이터를 받아오거나 가공처리를 오랫동안하고 나서 컨트롤러를 인스턴스화 할때 사용
                    Get.putAsync<DependencyController>(() async {
                      // 데이터 처리 후 인스턴스화
                      await Future.delayed(Duration(seconds: 5));
                      return DependencyController();
                    });
                  }),
                );
              },
            ),
            RaisedButton(
              child: Text("Get.create"),
              onPressed: () {
                // 인스턴스를 여러개 생성
                Get.to(GetPut(), binding: BindingsBuilder(() {
                  // 사용할때성 마다 인스턴스 생성
                  Get.create<DependencyController>(
                      () => DependencyController());
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
