import 'package:kaash_app/diseases.dart';
import 'package:kaash_app/reduceCard.dart';
import 'package:flutter/material.dart';
import 'package:kaash_app/shared/buttons.dart';
import 'package:page_transition/page_transition.dart';
class result extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  result({this.bmiResult,this.resultText,this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RESULT'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
                  child: Center(
                      child: Text('YOUR BMI RESULT')))),
          Expanded(flex:5,
              child: ReduceCard(colour: Colors.blueGrey,col: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                  ),
                  Text(
                    bmiResult,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                  ),
                  button((){
                    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child:diseases()));
                  })
                ],
              ),)),
        ],
      ),
    );
  }
}
