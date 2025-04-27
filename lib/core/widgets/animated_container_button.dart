import 'package:course_ed_tech/core/widgets/build_text.dart';
import 'package:flutter/material.dart';

class AnimatedContainerButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;

  const AnimatedContainerButton({super.key, required this.text, this.onTap});

  @override
  State<AnimatedContainerButton> createState() =>
      AnimatedContainerButtonState();
}

class AnimatedContainerButtonState extends State<AnimatedContainerButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.95);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 150),
        scale: _scale,
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey),
          ),
          width: double.infinity,
          height: 80,
          child: Center(
            child: BuildText(
              text: widget.text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
