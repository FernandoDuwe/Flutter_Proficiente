import 'package:flutter/material.dart';

class TileCollection extends StatelessWidget {
  final String title;
  final int count;
  final Icon icon;

  const TileCollection(
      {required this.title, required this.count, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            this.icon,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.title,
                    style: TextStyle(fontSize: 24, color: Colors.black45),
                  ),
                  SizedBox(height: 22,),
                  Text(
                    this.count.toString(),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
