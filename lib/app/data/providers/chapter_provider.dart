import 'package:get/get.dart';
import 'package:opm/app/data/models/all_chapter_model.dart';

import '../models/chapter_model.dart';

class ChapterProvider extends GetConnect {
  //String link = "http://192.168.1.8/vid/opmanga";
  String link = "https://opmangaapi.000webhostapp.com";
  AllChapter? nchpt;
  AllChapter? pchpt;

  Future<List<Chapter>> getAllImage(String token) async {
    final response = await get('$link/api.php?id=$token');
    //print('TOKEN : $link/api.php?id=$token');
    nchpt = AllChapter.fromJson(response.body["nav"]["next"]);
    pchpt = AllChapter.fromJson(response.body["nav"]["prev"]);
    return Chapter.fromJsonList(response.body["img"]);
  }

  Future<Map<String, dynamic>> getChapterSekarang(String token) async {
    final response = await get('$link/api.php?id=$token');
    Map<String, dynamic> relis = {
      "next": AllChapter.fromJsonList(response.body["nav"]["next"]),
      "prev": AllChapter.fromJsonList(response.body["nav"]["prev"]),
      "imgs": Chapter.fromJsonList(response.body["img"])
    };
    return relis;
  }
}
