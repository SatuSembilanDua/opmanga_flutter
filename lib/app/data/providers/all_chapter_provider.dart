import 'package:get/get.dart';

import '../models/all_chapter_model.dart';

class AllChapterProvider extends GetConnect {
  //String link = "http://192.168.1.8/vid/opmanga";
  String link = "https://opmangaapi.000webhostapp.com";

  Future<List<AllChapter>> getAllChapter() async {
    final response = await get("$link/api.php");
    return AllChapter.fromJsonList(response.body);
  }

  Future<List<AllChapter>> getChapterSearch(String cari) async {
    final response = await get('$link/api.php?cari=$cari');
    return AllChapter.fromJsonList(response.body);
  }
}
