import 'package:get/get.dart';
import 'package:opm/app/data/models/all_chapter_model.dart';
import 'package:opm/app/data/providers/all_chapter_provider.dart';

class HomeController extends GetxController {
  final list_chapter = Future.value(<AllChapter>[]).obs;
  //List<AllChapter> list_chapter = [];
  AllChapterProvider acp = AllChapterProvider();

  @override
  void onInit() async {
    debounce(list_chapter, (data) => print("List Berubah !"),
        time: Duration(seconds: 2));
    super.onInit();
    fetchList("");
  }

  Future<List<AllChapter>> getAllChapters() async {
    return await acp.getAllChapter();
  }

  void fetchList(String cari) async {
    if (cari == "") {
      list_chapter.value = getAllChapters();
    } else {
      list_chapter.value = getChaptersSeacrh(cari);
    }
    print("fetch Data");
  }

  void cobaCari(String cari) async {
    list_chapter.value = getChaptersSeacrh(cari);
  }

  Future<List<AllChapter>> getChaptersSeacrh(String cari) async {
    return await acp.getChapterSearch(cari);
  }
}
