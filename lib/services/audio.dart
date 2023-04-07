/// 播放状态枚举
enum AudioPlayerState {
  stopped, // 初始状态，已停止或发生错误
  playing, // 正在播放
  paused, // 暂停
  completed // 播放结束
}

abstract class IAudioService {
  play(); // play  播放
  setPlayUrl(String url, String imgUrl); // set play url
  String? getPlayUrl(); // 获取当前播放url
  seek(Duration duration); // 跳转到几秒到位置
  setSpeed(double speed); // 设置快进速度
  double getSetSpeed(); // 获取播放速度
  pause(); // 暂停
  stop(); // stop and free resources
  Duration? duration(); // 获取 music 长度
  Stream<Duration> position(); // 位置
  bool playing(); // 播放ing
}
