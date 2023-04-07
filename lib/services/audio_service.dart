import 'package:flutter/cupertino.dart';
import 'package:just_audio/just_audio.dart';
import 'package:podcast/services/audio.dart';
import 'package:flutter/material.dart';

import '../widgets/rimg.dart';

class AudioService implements IAudioService {
  static AudioService? _instance;

  AudioService._internal();

  String? _playUrl;
  String? _playImg;
  double _speed = 1.0;
  final AudioPlayer _player = AudioPlayer();

  // 工厂构造函数
  factory AudioService() {
    _instance ??= AudioService._internal();

    return _instance!;
  }

  @override
  String? getPlayUrl() {
    return _playUrl;
  }

  @override
  double getSetSpeed() {
    return _speed;
  }

  @override
  pause() async {
    if (_playUrl != null) {
      await _player.pause();
    }
  }

  @override
  play() async {
    if (_playUrl != null) {
      await _player.play();
    }
  }

  @override
  setPlayUrl(String url, String imgUrl) async {
    // if (_playUrl != null) {
    //   if (_playUrl != url) {
    //     await stop();
    //   }
    // }
    _playUrl = url;
    _playImg = imgUrl;
    await _player.setUrl(url);
  }

  @override
  seek(Duration duration) async {
    if (_playUrl != null) {
      await _player.seek(duration);
    }
  }

  @override
  setSpeed(double speed) async {
    _speed = speed;
    if (_playUrl != null) {
      await _player.setSpeed(speed);
    }
  }

  @override
  stop() async {
    if (_playUrl != null) {
      await _player.stop();
    }
  }

  // 获取 music 长度
  @override
  Duration? duration() {
    return _player.duration;
  }

  @override
  Stream<Duration> position() {
    return _player.positionStream;
  }

  @override
  bool playing() {
    return _player.playerState.playing;
  }

  Widget toRotate() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.orange,
      ),
      clipBehavior: Clip.antiAlias,
      child: RIMGWidget(_playImg != null
          ? _playImg!
          : "https://imagev2.xmcdn.com/group47/M05/53/60/wKgKk1ufEHXxZnLQAAKdqZFMMEU542.jpg"),
    );
  }
}
