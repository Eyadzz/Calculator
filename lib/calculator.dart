import 'package:calculator/buttonWidget.dart';
import 'package:calculator/oldResults.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class calculator extends StatefulWidget {
  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var backgroundColor = Color.fromRGBO(0, 0, 0, 1);
  var accentColor = Color.fromRGBO(218, 0, 55, 1);
  var text = "0";
  bool calculated = false;
  var prevEqu = {""};
  var prevResults = {""};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        titleSpacing: 5,
        backgroundColor: backgroundColor,
        elevation: 0,
        title: Row(
          children: [
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            SizedBox(
              width: 30,
            ),
            IconButton(icon: Icon(TablerIcons.calculator), onPressed: () {}),
            SizedBox(
              width: 30,
            ),
            IconButton(icon: Icon(Icons.compare_arrows_outlined), onPressed: () {}),
            SizedBox(
              width: 30,
            ),
            IconButton(icon: Icon(TablerIcons.currency_dollar), onPressed: () {}),
            SizedBox(
              width: 30,
            ),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ))),
              alignment: AlignmentDirectional.bottomEnd,
              child: SingleChildScrollView(
                child: Column(
                  verticalDirection: VerticalDirection.up,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      text,
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    for (int i = 0; i < prevEqu.length; i++)
                      oldResults(
                          prevEqu.elementAt(i), prevResults.elementAt(i)),
                  ],
                ),
              ),
            ),
          )),
          Expanded(
              child: Column(
              children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonWidget("C",update,accentColor,25),
                    SizedBox(width: 30,),
                    buttonWidget("DEL",update,accentColor,25),
                    SizedBox(width: 30,),
                    buttonWidget("%",update,accentColor,30),
                    SizedBox(width: 30,),
                    buttonWidget("÷",update,accentColor,40),
                    SizedBox(width: 30,),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonWidget("7",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("8",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("9",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("×",update,accentColor,40),
                    SizedBox(width: 30,),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonWidget("4",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("5",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("6",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("—",update,accentColor,30),
                    SizedBox(width: 30,),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buttonWidget("1",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("2",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("3",update,Colors.white,25),
                    SizedBox(width: 30,),
                    buttonWidget("+",update,accentColor,35),
                    SizedBox(width: 30,),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonWidget("AC",update,accentColor,25),
                      SizedBox(width: 30,),
                      buttonWidget("0",update,Colors.white,25),
                      SizedBox(width: 30,),
                      buttonWidget(".",update,Colors.white,30),
                      SizedBox(width: 30,),
                      Ink(
                          decoration: ShapeDecoration(
                            shape: CircleBorder(),
                            color: accentColor,
                          ),
                          child: buttonWidget("=",update,Colors.white,35)),
                      SizedBox(width: 30,),
                    ],
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

   update(String input) {
    setState(() {
      if (calculated)
      {
        calculated = false;
        text = "";
      }
      if (input == "C")
        text = "0";

      else if (input == "DEL" && input.isNotEmpty)
      {
        text = text.substring(0, text.length - 1);
        if (input.isEmpty) text = "0";
      }

      else if (input == "AC")
      {
        prevEqu.clear();
        prevResults.clear();
        text = "0";
      }
      else if(input =="=")
      {
        calculate();
      }
      else {
        if (text == "0")
          text = input;
        else
          text += input;
      }
    });
  }

   calculate() {
    if (text != "0") {
      Parser p = Parser();
      Expression exp = p.parse(text);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      prevEqu.add(text);
      setState(() {
        text = eval.toString();
      });
      prevResults.add(text);
      calculated = true;
    }
  }
}
