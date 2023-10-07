import 'package:flutter/material.dart';
import 'package:spotify_ui_prerna/data.dart';
import 'package:spotify_ui_prerna/screens/playlist_screen.dart';
import 'package:spotify_ui_prerna/widgets/widgets.dart';
import 'package:spotify_ui_prerna/models/current_track_model.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(

      create: (context) => CurrentTrackModel(),
      child: (
      const MyApp()
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        hintColor: const Color(0xFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 12.0,
            color: Color.fromRGBO(224, 224, 224, 1),
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyLarge: TextStyle(
            color: Color.fromRGBO(224, 224, 224, 1),
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyMedium: TextStyle(
            color: Color.fromRGBO(224, 224, 224, 1),
            letterSpacing: 1.0,
          ),
        ),
      ),
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                SideMenu(),
                Expanded(
                    child: PlaylistScreen(
                  playlist: lofihiphopPlaylist,
                )),
              ],
            ),
          ),
          CurrentTrack(),
        ],
      ),
    );
  }
}