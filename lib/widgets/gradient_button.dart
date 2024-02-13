import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const GradientElevatedButton(
      {super.key, required this.onPressed, required this.child});

  @override
  State<GradientElevatedButton> createState() => _GradientElevatedButtonState();
}

class _GradientElevatedButtonState extends State<GradientElevatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: const BorderSide(width: 0.4),
                ),
              ),
              elevation: MaterialStateProperty.all(1),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.lightBlue[100]!;
                  }
                  final hue = _animation.value * 360;
                  return HSVColor.fromAHSV(0.5, hue, 0.5, 1.0).toColor();
                },
              ),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
