import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  /*final onTap;
  final String title, author,image;


  const PostContainer({Key key, this.onTap, this.title, this.author, this.image}) : super(key: key);*/
  final String image;
  final String title;
  final onTap;
  PostContainer({@required this.image,@required this.title,@required this.onTap});
  @override

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(onTap: onTap,
      child: Container(padding: EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            Container(height: size.height*.2,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(image))),
            ),
            Text(title,textAlign: TextAlign.center ,style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    );

  }
}