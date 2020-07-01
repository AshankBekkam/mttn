import 'heading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Feed extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Heading(title:"Articles"),
          ];
        },
        body:
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          child: ListView.builder(
              itemCount: numbers.length, itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: <Widget>[
                  Card(
                    color: Colors.blue,
                    child: Container(height: size.height*.2,
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                  Text('Lorem ipsum this is placeholder text for the title tralalalal',textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),)
                ],
              ),
            );
          }),
        ),
      ),
    );

  }
}
