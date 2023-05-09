import 'package:flutter/services.dart' as the_bundle;

import '../export_url/export_url.dart';

class Helper {
  Future<List<MenModel>> getMenModels() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleList = menModelFromJson(data);

    return maleList;
  }

  Future<List<MenModel>> getFemaleModels() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleList = menModelFromJson(data);

    return femaleList;
  }

  Future<List<MenModel>> getKidsModels() async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidsList = menModelFromJson(data);

    return kidsList;
  }

  //single Mens id

  Future<MenModel> getMenModelsId(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');
    final maleList = menModelFromJson(data);
    final sneaker = maleList.firstWhere((element) => element.id == id);
    return sneaker;
  }

  Future<MenModel> getFemaleModelsId(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');
    final femaleList = menModelFromJson(data);
    final sneaker = femaleList.firstWhere((element) => element.id == id);
    return sneaker;
  }

  Future<MenModel> getKidsModelsId(String id) async {
    final data =
        await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');
    final kidsList = menModelFromJson(data);
    final sneaker = kidsList.firstWhere((element) => element.id == id);
    return sneaker;
  }
}
