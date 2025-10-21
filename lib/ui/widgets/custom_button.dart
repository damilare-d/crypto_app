import 'package:flutter/material.dart';

import '../common/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPrimaryPressed,
    required this.buttonText,
  });

  final void Function()? onPrimaryPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPrimaryPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // backgroundColor replaced by gradient using Ink
        backgroundColor: Colors.transparent,
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
          child: Text(buttonText,
              style: ktsBodyText.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
