import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            SizedBox(
              width: 16,
            ),
            Text("An error occured while loading stories.")
          ],
        ),
      ),
    );
  }
}
