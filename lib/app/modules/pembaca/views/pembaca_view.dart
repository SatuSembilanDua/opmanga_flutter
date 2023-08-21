import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:opm/app/data/models/chapter_model.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import '../controllers/pembaca_controller.dart';

class PembacaView extends GetView<PembacaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF222222),
          title: const Text(
            "OPManga",
            style: TextStyle(fontFamily: 'opfont', fontSize: 40),
          ),
          centerTitle: false,
          actions: [
            IconButton(
                onPressed: () {
                  print("Refresh");
                  controller.fetchList();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: GetX<PembacaController>(
            init: PembacaController(),
            builder: (ctx) {
              return Column(mainAxisSize: MainAxisSize.max, children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 5),
                    decoration: myBoxDecoration(),
                    child: Text(controller.judul_chapter),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: FutureBuilder<List<Chapter>>(
                    future: controller.list_image.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData) {
                        print("Has No data");
                        return TerjadiKesalahan();
                      } else {
                        return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              Chapter chpt = snapshot.data![index];
                              return PinchZoomImage(
                                image: CachedNetworkImage(
                                  imageUrl: chpt.img!,
                                  placeholder: (context, url) => Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(20),
                                    child: const CircularProgressIndicator(),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Text("No Image!"),
                                ),
                                zoomedBackgroundColor:
                                    Color.fromRGBO(34, 34, 34, 1.0),
                                //hideStatusBarWhileZooming: true,
                              );
                            });
                      }
                    },
                  ),
                )),
                Container(
                  width: double.infinity,
                  color: const Color(0xFF222222),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 2.5),
                        IconButton(
                            onPressed: () {
                              controller.btn_berikut_chapter();
                            },
                            tooltip: "Next Chapter",
                            color: Colors.white,
                            icon: Icon(Icons.skip_previous)),
                        IconButton(
                            onPressed: () {
                              print("List Chapter");
                              Get.back();
                            },
                            tooltip: "List Chapter",
                            color: Colors.white,
                            icon: Icon(Icons.list)),
                        IconButton(
                            onPressed: () {
                              controller.btn_sebelum_chapter();
                            },
                            tooltip: "Previous Chapter",
                            color: Colors.white,
                            icon: Icon(Icons.skip_next)),
                        SizedBox(width: 2.5),
                      ]),
                )
              ]);
            }));
  }
}

BoxDecoration myBoxDecoration() {
  return const BoxDecoration(
    border: Border(
        bottom: BorderSide(
      color: Color(0xFF3C9CCD),
      width: 2.0,
    )),
  );
}

class TerjadiKesalahan extends StatelessWidget {
  const TerjadiKesalahan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      child: Column(
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
          Image.asset("assets/imgs/choppersad.png")
        ],
      ),
    );
  }
}


/* 


 */