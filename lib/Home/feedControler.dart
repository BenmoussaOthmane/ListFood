import 'package:flutter/material.dart';
class FeedControler extends ChangeNotifier{
  int ind=0;
  int incolor =0;
  changeCounttabe(int nbr){
    ind = nbr;
    incolor = nbr;
    notifyListeners();
  }
}