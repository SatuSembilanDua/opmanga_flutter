import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../data/models/all_chapter_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xFF222222),
          title: const Text(
            "OPManga",
            style: TextStyle(fontFamily: 'opfont', fontSize: 40),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: const Text("OPManga"),
                          content: const Text("Version 0.2.0"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            )
                          ],
                        )),
                icon: Icon(Icons.info_outline_rounded))
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: TextField(
                autocorrect: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    labelText: 'Cari'),
                onChanged: (value) => controller.cobaCari(value),
              ),
            ),
            Expanded(
              child: GetX<HomeController>(
                  init: HomeController(),
                  builder: (ctrl) {
                    return FutureBuilder<List<AllChapter>>(
                      future: controller.list_chapter.value,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return TerjadiKesalahan();
                        } else {
                          return ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                AllChapter chpt = snapshot.data![index];
                                return ListTile(
                                  leading: Image.asset(
                                    "assets/imgs/hashtag.png",
                                    width: 50,
                                    height: 50,
                                  ),
                                  title: Text(chpt.judul!),
                                  subtitle: Text(chpt.date!),
                                  onTap: () {
                                    Get.toNamed("/pembaca", arguments: [
                                      chpt,
                                      snapshot.data,
                                      index
                                    ]);
                                  },
                                );
                              });
                        }
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class TerjadiKesalahan extends StatelessWidget {
  const TerjadiKesalahan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Terjadi Kesalahan!",
            style: TextStyle(fontFamily: 'opfont', fontSize: 40),
          ),
        ),
        Container(
          child: Image.asset("assets/imgs/choppersad.png"),
        )
      ],
    );
  }
}
