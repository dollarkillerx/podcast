class AppRoutes {
  static const String Home = '/home';
  static const String Recommend = '/recommend'; // 推荐屏
  static const String MusicDetails = '/music_details'; // 推荐屏
  static const String MusicCard = '/music_card'; // 推荐屏

  static const String NotFound = '/unknown';

  static String pathJoin(List<String> paths) {
    return paths.join("");
  }
}

