import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget {

  Function f;
  String text;
  var accentColor;
  double fontSize;
  buttonWidget(this.text,this.f,this.accentColor,this.fontSize);

  correctSymbols()
  {
    if(text=="÷")
      text="/";
    else if(text=="—")
      text="-";
    else if(text=="×")
      text="*";

    f(text);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        correctSymbols();
      },
      child: Text(
        text,
        style: TextStyle(color: accentColor, fontSize: fontSize),
      ),
    );
  }
}
