import 'package:flutter/material.dart';

class ReduceCard extends StatelessWidget {
  final Color colour;
  Widget col;
  ReduceCard({@required this.colour,this.col});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),
        color: colour,

      ) ,
      child: col,
    );
  }
}