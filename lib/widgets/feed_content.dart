import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mttn/widgets/big_post.dart';
import 'package:mttn/widgets/small_post.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  final List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .35,
            margin: const EdgeInsets.symmetric(vertical: 15.0),
            child: PageView.builder(
                controller: PageController(viewportFraction: .75),
                scrollDirection: Axis.horizontal,
                itemCount: numbers.length,
                itemBuilder: (context, index) => OverlayedContainer() ,),
          ),
          Container(
            padding: EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text('All Posts',
                      style: GoogleFonts.robotoSlab(fontSize: 30,color: Colors.white,)),
                ),
                ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount:10, itemBuilder: (context, index) => PostContainer() ,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
