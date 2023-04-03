import 'package:get/get.dart';
import 'package:podcast/pages/recommend/binding.dart';
import 'package:podcast/pages/recommend/index.dart';
import '../../components/unknown_route.dart';
import '../../pages/home/binding.dart';
import '../../pages/home/index.dart';
import 'app_routes.dart';

class AppPages {
  static const InitRoute = AppRoutes.Recommend;

  static final routers = [
    // 主页导航
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Recommend,
      page: () => RecommendPage(),
      binding: RecommendBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => UnknownRoute(),
  );
}