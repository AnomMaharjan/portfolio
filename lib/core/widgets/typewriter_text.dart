import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/text_scale_factor.dart';

class TypewriterText extends StatefulWidget {
  final double textSize;
  final List<String> texts; // List of strings to display one by one

  const TypewriterText(
      {super.key,
      required this.texts,
      this.textSize = 16 // Pass the list of strings to the widget
      });

  @override
  State createState() => TypewriterTextState();
}

class TypewriterTextState extends State<TypewriterText>
    with TickerProviderStateMixin {
  Animation<int>? _characterCount;
  AnimationController? _controller;
  int _stringIndex = 0; // Keep track of the current string index
  bool _isWriting = true; // true for writing, false for erasing

  String get _currentString => widget.texts[_stringIndex % widget.texts.length];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _controller!.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await Future.delayed(const Duration(seconds: 1)); // 1-second delay
        if (!_isWriting) {
          _moveToNextString();
        }
        _toggleDirection();
      }
    });
    typewriterEffect();
  }

  void _toggleDirection() {
    setState(() {
      _isWriting = !_isWriting;
      _characterCount = StepTween(
        begin: _isWriting ? 0 : _currentString.length,
        end: _isWriting ? _currentString.length : 0,
      ).animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
      _controller!.forward(from: 0);
    });
  }

  void _moveToNextString() {
    setState(() {
      _stringIndex = (_stringIndex + 1) % widget.texts.length;
    });
  }

  Future<void> typewriterEffect() async {
    setState(() {
      _characterCount = StepTween(
        begin: 0,
        end: _currentString.length,
      ).animate(CurvedAnimation(parent: _controller!, curve: Curves.easeIn));
    });
    await _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _characterCount == null
          ? null
          : AnimatedBuilder(
              animation: _characterCount!,
              builder: (BuildContext context, Widget? child) {
                String text =
                    _currentString.substring(0, _characterCount!.value);
                return Text(
                  text,
                  style: GoogleFonts.bebasNeue(
                    fontSize: widget.textSize,
                    fontWeight: FontWeight.w100,
                    height: 1,
                    color: Colors.white,
                  ),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(
                      context,
                      maxTextScaleFactor: 6,
                    ),
                  ),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
