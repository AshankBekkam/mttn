import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  /*final onTap;
  final String title, author,image;


  const PostContainer({Key key, this.onTap, this.title, this.author, this.image}) : super(key: key);*/
  final String image;
  final String title;
  PostContainer({@required this.image,@required this.title});
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          Card( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9),),
            color: Colors.blue,
            child: Container(height: size.height*.2,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))),
            ),
          ),
          Text(title,textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),)
        ],
      ),
    );

  }
}