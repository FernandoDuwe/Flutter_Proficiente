import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DisplayVirtual extends StatelessWidget {
  const DisplayVirtual({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String viewType = '<platform-view-type>';

    final Map<String, dynamic> creationParams = <String, dynamic>{};


    return Scaffold(
      body: AndroidView(
        viewType: viewType,
        layoutDirection: TextDirection.ltr,
        creationParams: creationParams,
        creationParamsCodec: const
        StandardMessageCodec(),
      ),
    );
  }
}
