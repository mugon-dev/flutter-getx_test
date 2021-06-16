import 'package:get/get.dart';

// trigger를 위해 getxcontroller 상속
class CountControllerWithReactive extends GetxController {
  RxInt count = 0.obs; // 반응형 상태관리
  void increase() {
    count++;
  }

  void putNumber(int value) {
    count(value);
  }

  // getxcontroller lifecycle
  @override
  void onInit() {
    // TODO: implement onInit
    // worker
    // 매번 값이 변경될 때 마다 호출 (반응 상태일때만 가능)
    ever(count, (_) => print("매번 호출"));
    // 한번만 호출
    once(count, (_) => print("한번만 호출"));
    // 이벤트가 끝났을때 실행
    debounce(count, (_) => print("마지막 변경에 한번만 호출"), time: Duration(seconds: 1));
    // 변경되고 있는 동안 설정한 초마다 실행
    interval(count, (_) => print("변경되고 있는 동안 1초마다 호출"),
        time: Duration(seconds: 1));
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
