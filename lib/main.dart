import 'package:flutter/material.dart';
import 'package:kaash_app/Home.dart';


void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        canvasColor: Colors.white,
        accentColor: Colors.red),
    home:home(),
  ));
}
