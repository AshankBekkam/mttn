import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Heading extends StatelessWidget {
  String title;
  String image;
  Heading({this.title,thisimage});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(backgroundColor: Colors.black,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,

      flexibleSpace: FlexibleSpaceBar(
        centerTitle:true,
        title: Container(padding: EdgeInsets.only(top:30),
          child: Text(title,
              style: GoogleFonts.robotoSlab(fontSize: 30,color: Colors.white,)),
        ),
      ),

    );
  }
}
