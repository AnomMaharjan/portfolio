import 'package:flutter/material.dart';

class SlideWidget extends StatefulWidget {
  final double? width, height;

  const SlideWidget({super.key, this.width, this.height});

  @override
  _SlideWidgetState createState() => _SlideWidgetState();
}

class _SlideWidgetState extends State<SlideWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Slide in from the left (X = -1.0 means left outside of the screen)
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(2.0, 0.0), // Start position (off-screen to the left)
      end: Offset.zero, // End position (on-screen at the center)
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInOut,
    ));

    _controller!.forward(); // Start the animation when the widget is built
  }

  @override
  void dispose() {
    _controller!
        .dispose(); // Dispose of the controller when the widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation!,
      child: Image.asset(
        "assets/cover.png",
        fit: BoxFit.fitHeight,
        height: widget.height,
      ),
    );
  }
}
