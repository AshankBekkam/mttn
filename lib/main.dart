import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoSlabTextTheme(Theme.of(context).textTheme),

        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        
        primarySwatch: Colors.amber,
        primaryColor: Color.fromRGBO(250, 215, 0, 1),
      ),

      home: Home(),
    );
  }
}

