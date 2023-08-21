import 'package:get/get.dart';
import 'package:opm/app/data/models/all_chapter_model.dart';
import 'package:opm/app/data/models/chapter_model.dart';
import 'package:opm/app/data/providers/chapter_provider.dart';

class PembacaController extends GetxController {
  //dynamic argumentData = Get.arguments;
  AllChapter cur_chapter = Get.arguments[0];
  List<AllChapter> all_chap = Get.arguments[1];
  int index_chap = Get.arguments[2];
  final chs = Future.value(<Map<String, dynamic>>[]).obs;
  final list_image = Future.value(<Chapter>[]).obs;
  ChapterProvider cp = ChapterProvider();
  String judul_chapter = "";
  String token = "";
  AllChapter? next_chapter;
  AllChapter? prev_chapter;

  @override
  void onInit() async {
    super.onInit();
    fetchList();
  }

  Future<List<Chapter>> getAllImage(String token) async {
    var cpgai = await cp.getAllImage(token);
    next_chapter = cp.nchpt;
    prev_chapter = cp.pchpt;
    return cpgai;
  }

  Future<Map<String, dynamic>> getChapSekarang(String token) async {
    return await cp.getChapterSekarang(token);
  }

  void fetchList() async {
    judul_chapter = cur_chapter.judul!;
    print("Index Chapter : $index_chap");
    /* if (index_chap <= 0) {
      print("Last Chapter");
      prev_chapter = all_chap[index_chap + 1];
    } else if (index_chap >= all_chap.length) {
      print("First Chapter");
      next_chapter = all_chap[index_chap - 1];
    } else {
      prev_chapter = all_chap[index_chap + 1];
      next_chapter = all_chap[index_chap - 1];
    } */
    list_image.value = getAllImage(cur_chapter.token!);
  }

  void btn_berikut_chapter() {
    print("Next Chapter");
    if (next_chapter != null) {
      cur_chapter = next_chapter!;
      print(cur_chapter.judul);
      if (index_chap != 0) {
        index_chap--;
      }
      fetchList();
    }
  }

  void btn_sebelum_chapter() {
    print("Previous Chapter");
    if (prev_chapter != null) {
      cur_chapter = prev_chapter!;
      print(cur_chapter.judul);
      index_chap++;
      fetchList();
    }
  }
}
