import 'package:flutter/material.dart';
import 'package:hello_world/views/login.dart';


void main() => runApp(MaterialApp(
  home: Login(),
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.green),
));