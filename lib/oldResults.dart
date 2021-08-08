import 'package:flutter/material.dart';

class oldResults extends StatelessWidget {
  String result,equ;
  oldResults(this.equ, this.result);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(equ, style: TextStyle(fontSize: 25, color: Colors.grey),),
        Text("="+result, style: TextStyle(fontSize: 25, color: Colors.grey),),
      ],
    );
  }
}
