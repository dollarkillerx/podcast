import 'package:flutter/material.dart';

class RIMGWidget extends StatefulWidget {
  int duration;
  final String img;

  @override
  _RIMGWidgetState createState() => _RIMGWidgetState();

  RIMGWidget(this.img, {this.duration = 5});
}

class _RIMGWidgetState extends State<RIMGWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _angle = 0;
  bool playing = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(seconds: widget.duration))
      ..addListener(() {
        setState(() {
          _angle = _controller.value * 360;
        });
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (playing) {
          _controller.stop();
          playing = !playing;
          return;
        }
        _controller.forward();
        _controller.repeat();
        playing = !playing;
      },
      child: Container(
        child: Transform.rotate(
          angle: _angle * 3.1416 / 180,
          child: Image.network(
            widget.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
