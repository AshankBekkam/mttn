import 'package:flutter/material.dart';
import 'heading.dart';

class Directory extends StatelessWidget {
  const Directory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              Heading(title: "Directory"),
            ];
          },
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: GridView.builder(itemCount: numbers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0),
                itemBuilder: (BuildContext context,int index){

                    return Card(
                      color: Colors.blue,
                      child: Container(
                        child: Center(child: Text(numbers[index].toString(), style: TextStyle(color: Colors.white, fontSize: 36.0),)),

                    ),
                  );
                }),
          )),
    );
  }
}
