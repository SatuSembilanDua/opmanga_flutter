import 'package:get/get.dart';

import '../controllers/pembaca_controller.dart';

class PembacaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembacaController>(
      () => PembacaController(),
    );
  }
}
