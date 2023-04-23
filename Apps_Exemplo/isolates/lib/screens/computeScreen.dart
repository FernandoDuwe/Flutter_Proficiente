import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeScreen extends StatelessWidget {
  const ComputeScreen({Key? key}) : super(key: key);

  double countTo(RangeValues prRange) {
    double vrI = 0;

    for (vrI = prRange.start; vrI <= prRange.end; vrI++)
      print(vrI);

    return vrI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compute"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(onPressed: () {
            compute<RangeValues, double>(countTo, RangeValues(100, 500));
          }, child: Text("Iniciar"))
        ],
      ),
    );
  }
}
