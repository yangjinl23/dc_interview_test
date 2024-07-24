import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splashPage/bindings/splash_page_binding.dart';
import '../modules/splashPage/views/splash_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_PAGE,
      page: () => const SplashPageView(),
      binding: SplashPageBinding(),
    ),
  ];
}
