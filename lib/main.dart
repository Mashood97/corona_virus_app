import 'package:flutter/material.dart';
import './screens/corona_stats.dart';
import './screens/country_wise_corona.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        backgroundColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor:Color(0xFF0A0E21) ,
        primaryColor: Color(0xFFEB1555),
        accentColor: Color(0xFF111355),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CoronaStats(),
        CountryWiseCorona.routeArgs: (ctx) => CountryWiseCorona(),
      },
    );
  }
}
