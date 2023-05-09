import 'package:flutter/material.dart';

import '../models/mens_model.dart';
import '../services/helpers.dart';

class ProductProvider extends ChangeNotifier {
  int _activePage = 0;
  List<dynamic> _shoeSizes = [];
  List<String> _sizes = [];

  int get activePage => _activePage;

  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoeSizes => _shoeSizes;

  set shoesSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  //multiple item Select

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]['isSelected'] = !_shoeSizes[i]['isSelected'];
      }
    }
    notifyListeners();
  }

  List<String> get sizes => _sizes;

  set sizes(List<String> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }

  late Future<List<MenModel>> male;
  late Future<List<MenModel>> female;
  late Future<List<MenModel>> kids;

  void getMale() {
    male = Helper().getMenModels();
  }

  void getWomen() {
    female = Helper().getFemaleModels();
  }

  void getKids() {
    kids = Helper().getKidsModels();
  }
}
