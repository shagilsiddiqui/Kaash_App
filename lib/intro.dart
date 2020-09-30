import 'package:flutter/material.dart';
import 'package:kaash_app/diseases.dart';
import 'package:kaash_app/shared/colors.dart';
import 'package:kaash_app/shared/styles.dart';
import 'package:kaash_app/shared/inputFields.dart';
import 'package:kaash_app/shared/buttons.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:math';
import 'package:kaash_app/calculations.dart';
import 'package:kaash_app/result.dart';

class intro extends StatefulWidget {
  @override
  _introState createState() => _introState();
}

class _introState extends State<intro> {
  String dropdownValue = 'Male';
  String weight='0.0';
  String height='0.0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: Text('About Patient', style: contrastText),
          centerTitle: true,
        ),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      fryoTextInput('Age'),

                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black87),
//                  underline: Container(
//                    height: 2,
//                    color: Colors.deepPurpleAccent,
//                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Male', 'Female', 'Transgender']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                      fryoTextInput('Occupation'),
                      fryoTextInput('Height(in cm)',onChanged: (String value){
                        setState(() {
                          height=value;
                        });
                      }),
                      fryoTextInput('Weight(in Kg)',onChanged: (String value){
                        weight=value;
                      }),
                      SizedBox(
                        height: 10.0,
                      ),
                      GestureDetector(
                        onTap: (){
                          CalculatorBrain calc =
                          CalculatorBrain(height:double.parse(height), weight: double.parse(weight));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => result(
                                    bmiResult: calc.calculateBMI(),
                                    resultText: calc.getResult(),
                                    interpretation: calc.getInterpretation(),
                                  )));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 10.0),
                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(5.0),color: Colors.cyan),
                          width: double.infinity,
                          height: 50.0,
                          child: Text('CALCULATE',textAlign: TextAlign.center),
                          //color: Colors.cyan,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      )

                    ],
                  ),

                ],
              ),


              width: double.infinity,
              decoration: authPlateDecoration,
            ),
          ],
        )
    );
  }
}

