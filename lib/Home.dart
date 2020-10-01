import 'package:flutter/material.dart';
import 'package:kaash_app/intro.dart';
import 'package:kaash_app/permiServices.dart';
import 'package:kaash_app/shared/buttons.dart';
import 'package:kaash_app/shared/styles.dart';
import 'package:page_transition/page_transition.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/11.png', width: 220, height: 220),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 0),
                child: Text('Kaash App', style: logoStyle),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(bottom: 0),
                child: froyoFlatBtn('Enter', () async {
                   bool s = await PermissionsService().requeststoragePermission(); 
                  bool v=  await PermissionsService().requevoicePermission();
                  if( v && s) {
                    print(v.toString());
                  Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.rotate, duration: Duration(milliseconds: 10),  child:intro()));
                  }
                }  ),
              ),
            ],
          )),
      backgroundColor: Colors.white,
    );;
  }
}
