import 'package:flutter/material.dart';
import 'package:songdataapp/providers/search_result_provider.dart';
import 'package:songdataapp/screens/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SongDataApp());
}

class SongDataApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Song Data App",
      home: ChangeNotifierProvider<SearchResultProvider>(
        create: (_) => SearchResultProvider(),
        child: SearchScreen(),
        //routes: {SongDataScreen.route: (context) => TheBeastLyricsHomePage()},
      ),
    );
  }
}
