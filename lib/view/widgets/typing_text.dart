import 'dart:async';
import 'package:flutter/material.dart';
import '../../res/constants.dart';

/// Typing animation widget that cycles through multiple texts
class TypingText extends StatefulWidget {
  final List<String> texts;
  final TextStyle? style;
  final Duration typingSpeed;
  final Duration pauseDuration;

  const TypingText({
    super.key,
    required this.texts,
    this.style,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.pauseDuration = const Duration(seconds: 2),
  });

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText> {
  int _textIndex = 0;
  int _charIndex = 0;
  bool _isTyping = true;
  String _displayText = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (!mounted) return;

      setState(() {
        if (_isTyping) {
          if (_charIndex < widget.texts[_textIndex].length) {
            _displayText =
                widget.texts[_textIndex].substring(0, _charIndex + 1);
            _charIndex++;
          } else {
            _isTyping = false;
            _timer?.cancel();
            Future.delayed(widget.pauseDuration, () {
              if (mounted) {
                _timer = Timer.periodic(
                  const Duration(milliseconds: 50),
                  (_) => _deleteText(),
                );
              }
            });
          }
        }
      });
    });
  }

  void _deleteText() {
    if (!mounted) return;

    setState(() {
      if (_charIndex > 0) {
        _charIndex--;
        _displayText = widget.texts[_textIndex].substring(0, _charIndex);
      } else {
        _timer?.cancel();
        _textIndex = (_textIndex + 1) % widget.texts.length;
        _isTyping = true;
        _startTyping();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          _displayText,
          style: widget.style ??
              const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
        // Blinking cursor
        _BlinkingCursor(color: widget.style?.color ?? accentPink),
      ],
    );
  }
}

class _BlinkingCursor extends StatefulWidget {
  final Color color;

  const _BlinkingCursor({required this.color});

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: Container(
            width: 2,
            height: 24,
            margin: const EdgeInsets.only(left: 2),
            color: widget.color,
          ),
        );
      },
    );
  }
}
