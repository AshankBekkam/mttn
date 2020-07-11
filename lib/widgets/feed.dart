import 'package:mttn/widgets/feed_content.dart';
import 'package:google_fonts/google_fonts.dart';
import 'heading.dart';
import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: FeedContent(),
    appBar: PreferredSize(preferredSize: Size.fromHeight(80),child: AppBar(centerTitle: true,title:Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Text('Articles'
          ,style: GoogleFonts.robotoSlab(fontSize: 40,color: Colors.white,)),
    ),elevation: 0,backgroundColor: Colors.black,)),);
  }
}
