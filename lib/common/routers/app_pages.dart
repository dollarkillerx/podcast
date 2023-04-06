import 'package:get/get.dart';
import 'package:podcast/pages/music_details/binding.dart';
import 'package:podcast/pages/music_details/index.dart';
import 'package:podcast/pages/recommend/binding.dart';
import 'package:podcast/pages/recommend/index.dart';
import '../../components/unknown_route.dart';
import '../../pages/home/binding.dart';
import '../../pages/home/index.dart';
import 'app_routes.dart';

class AppPages {
  // static const InitRoute = AppRoutes.Recommend;
  static const InitRoute = AppRoutes.Home;

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
    GetPage(
      name: AppRoutes.MusicDetails,
      page: () => MusicDetailsPage(),
      binding: MusicDetailsBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => UnknownRoute(),
  );
}
