import 'package:flutter/material.dart';
import 'package:kaash_app/Risk.dart';
import 'package:kaash_app/shared/colors.dart';
import 'package:kaash_app/shared/buttons.dart';
import 'package:kaash_app/shared/Data.dart' as global;
import 'package:page_transition/page_transition.dart';
class diseases extends StatefulWidget {
  @override
  _diseasesState createState() => _diseasesState();
}

class _diseasesState extends State<diseases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Disease'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: MyStatefulWidget(),
    );
  }
}


enum SingingCharacter { Healthy, Allergy,Asthama,TB,CoronaVirus,Pneumonia,Bronchitectasis,BronChitis,LungCancer,Other }

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter _character = SingingCharacter.Healthy;

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Healthy'),
            leading: Radio(
              value: SingingCharacter.Healthy,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Healthy';

                });
              },
            ),
          ),
          ListTile(
            title: const Text('Allergy'),
            leading: Radio(
              value: SingingCharacter.Allergy,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Allergy';

                });
              },
            ),
          ),
          ListTile(
            title: const Text('Asthama'),
            leading: Radio(
              value: SingingCharacter.Asthama,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Asthama';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('TB'),
            leading: Radio(
              value: SingingCharacter.TB,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='TB';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('CoronaVirus'),
            leading: Radio(
              value: SingingCharacter.CoronaVirus,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='CoronaVirus';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Pneumonia'),
            leading: Radio(
              value: SingingCharacter.Pneumonia,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='pneumonia';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Bronchiectasis'),
            leading: Radio(
              value: SingingCharacter.Bronchitectasis,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Bronchiectasis';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Bronchitis'),
            leading: Radio(
              value: SingingCharacter.BronChitis,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Bronchitis';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('LungCancer'),
            leading: Radio(
              value: SingingCharacter.LungCancer,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Lung Cancer';
                });
              },
            ),
          ),
          ListTile(
            title: const Text('other'),
            leading: Radio(
              value: SingingCharacter.Other,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                  global.Disese='Other';
                });
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(child: button((){
            Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(seconds: 1),  child:Risk()));
          })),
        ],
      ),
    );
  }
}
