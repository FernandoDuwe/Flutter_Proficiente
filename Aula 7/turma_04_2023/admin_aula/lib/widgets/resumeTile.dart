import 'package:flutter/material.dart';

class ResumeTile extends StatelessWidget {
  final String title;
  final int count;
  final Widget lead;

  const ResumeTile(
      {required this.title, required this.count, required this.lead, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all()
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: this.lead,
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(this.title, style: TextStyle(fontSize: 18),),
                SizedBox(height: 10),
                Text(this.count.toString())
              ],
            ),
          ))
        ],
      ),
    );
  }
}
