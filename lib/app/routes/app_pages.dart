import 'package:get/get.dart';

import 'package:opm/app/modules/home/bindings/home_binding.dart';
import 'package:opm/app/modules/home/views/home_view.dart';
import 'package:opm/app/modules/pembaca/bindings/pembaca_binding.dart';
import 'package:opm/app/modules/pembaca/views/pembaca_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PEMBACA,
      page: () => PembacaView(),
      binding: PembacaBinding(),
    ),
  ];
}
