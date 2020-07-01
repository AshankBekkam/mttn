import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polygon_clipper/polygon_border.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class Academic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:50.0,left: 30),
            child: Row(
              children: <Widget>[
                CircleAvatar( radius: 40,
                  backgroundColor: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Column(
                    children: <Widget>[
                      Text('Ashank Bekkam',style: GoogleFonts.robotoSlab(fontSize: 25,color: Colors.blue),),
                    Text('180911138',style: GoogleFonts.robotoSlab(fontSize: 20,color: Colors.white)),],
                  ),
                )

              ],
            ),
          ),


        ],
      )

    );
  }
}