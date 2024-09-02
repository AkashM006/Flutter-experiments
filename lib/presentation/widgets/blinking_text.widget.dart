import 'package:flutter/material.dart';

class BlinkingText extends StatefulWidget {
  final Duration duration;
  final Widget child;

  const BlinkingText({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  State<BlinkingText> createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(
        reverse:
            true); // Repeat the animation in reverse to create blinking effect
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: widget.child,
    );
  }
}
