import 'package:flutter/material.dart';

class CEPInfoContainer extends StatelessWidget {
  final String title;
  final String info;

  const CEPInfoContainer({required this.title, required this.info, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 150,
          child: Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Text(this.info),
      ],
    );
  }
}
