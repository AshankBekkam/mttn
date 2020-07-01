import 'package:flutter/material.dart';
import 'package:mttn/widgets/heading.dart';

class Social extends StatelessWidget {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            Heading(title:"MTTN Socials"),
          ];
        },
        body:ListView(
          children: <Widget>[Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Text('Events',style: TextStyle(fontSize: 30,color: Colors.blue),),
          ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('Recent Tweets',style: TextStyle(fontSize: 30,color: Colors.blue),),
            ),
            Container(width: double.infinity,
              height: MediaQuery.of(context).size.height*.25,
              child: Card(color: Colors.blue,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('Instagram',style: TextStyle(fontSize: 30,color: Colors.blue),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbers.length, itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Card(
                    color: Colors.blue,
                    child: Container(
                      child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left:18.0),
              child: Text('Youtube',style: TextStyle(fontSize: 30,color: Colors.blue),),
            ),
            Container(width: double.infinity,
              height: MediaQuery.of(context).size.height*.25,
              child: Card(color: Colors.blue,

              ),
            ),

          ],
        ),

      ),
    );
  }
}