import 'package:flutter/material.dart';
import 'package:kaash_app/record.dart';
import 'package:kaash_app/shared/colors.dart';
import 'package:kaash_app/shared/buttons.dart';
import 'package:page_transition/page_transition.dart';

class Risk extends StatefulWidget {
  @override
  _RiskState createState() => _RiskState();
}

class _RiskState extends State<Risk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Risk Factor'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: MyStatefulWidget(),
    );
  }
}


enum SingingCharacter { HyperTension, Diabetes,None}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.HyperTension;

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('HyperTension'),
          leading: Radio(
            value: SingingCharacter.HyperTension,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Diabetes'),
          leading: Radio(
            value: SingingCharacter.Diabetes,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('None'),
          leading: Radio(
            value: SingingCharacter.None,
            groupValue: _character,
            onChanged: (SingingCharacter value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Center(child: button((){
          Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child:record()));
        })),
      ],
    );
  }
}
