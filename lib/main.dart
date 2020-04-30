import 'package:flutter/material.dart';
import 'package:worldtime/layouts/test.dart';
import 'package:worldtime/layouts/home.dart';
import 'package:worldtime/layouts/choose_location.dart';
import 'package:worldtime/layouts/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/choose': (context) => ChooseLocation(),
    '/test': (context) => Test(),
  },
));

