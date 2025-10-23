import 'package:flutter/material.dart';
import 'package:crypto_app/ui/common/text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPrimaryPressed;
  final String buttonText;
  final bool isDisabled;
  final bool isBusy;

  const CustomButton({
    super.key,
    required this.onPrimaryPressed,
    required this.buttonText,
    this.isDisabled = false,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool active = !isDisabled && !isBusy;

    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: ElevatedButton(
        onPressed: active ? onPrimaryPressed : null,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF483BEB), Color(0xFF7847E1), Color(0xFFDD568D)],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: isBusy
                  ? _GradientLoader()
                  : Text(
                      buttonText,
                      key: const ValueKey('text'),
                      style: ktsBodyText.copyWith(color: Colors.white),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Linear gradient loader animation for the busy state
class _GradientLoader extends StatefulWidget {
  const _GradientLoader();

  @override
  State<_GradientLoader> createState() => _GradientLoaderState();
}

class _GradientLoaderState extends State<_GradientLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                begin: Alignment(-1 + 2 * _controller.value, 0),
                end: Alignment(1 + 2 * _controller.value, 0),
                colors: const [
                  Colors.white24,
                  Colors.white,
                  Colors.white24,
                ],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: const Text(
              'Loading...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
