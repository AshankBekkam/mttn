import 'package:flutter/material.dart';
import 'heading.dart';
class Alerts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Heading(title:"Alerts"),
          ];
        },
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context,index){
            return Text(index.toString(),style: TextStyle(color: Colors.white),);
          },
        ),
      ),
    );
  }
}