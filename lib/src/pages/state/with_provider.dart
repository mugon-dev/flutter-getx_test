import 'package:flutter/material.dart';
import 'package:getx_route_test/src/pages/controller/count_controller_with_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Provider",
            style: TextStyle(fontSize: 50),
          ),
          Consumer<CountControllerWithProvider>(
            builder: (_, snapshot, child) {
              return Text("${snapshot.count}", style: TextStyle(fontSize: 50));
            },
          ),
          buildRaisedButton(context),
        ],
      ),
    );
  }

  Widget buildRaisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        // listen: false를 줘서 consumer 부분만 rebuild
        Provider.of<CountControllerWithProvider>(context, listen: false)
            .increase();
      },
      child: Text(
        "+",
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
