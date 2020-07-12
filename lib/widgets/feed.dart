import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mttn/bloc/post_bloc.dart';
import 'package:mttn/bloc/post_event.dart';
import 'package:mttn/widgets/feed_content.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Feed extends StatelessWidget {
  const Feed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocProvider(
          create: (context) =>
              PostBloc(httpClient: http.Client())..add(PostFetched()),
          child: FeedContent()),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('Articles',
                  style: GoogleFonts.robotoSlab(
                    fontSize: 40,
                    color: Colors.white,
                  )),
            ),
            elevation: 0,
            backgroundColor: Colors.black,
          )),
    );
  }
}
