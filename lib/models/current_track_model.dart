import 'package:flutter/material.dart';
import 'package:spotify_ui_prerna/data.dart';

class CurrentTrackModel extends ChangeNotifier{
  Song? selected;

  void selectTrack(Song track){
    selected = track;
    notifyListeners();
  }
}