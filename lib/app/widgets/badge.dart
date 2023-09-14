import 'package:flutter/material.dart';

class ZebraBadge extends StatelessWidget {
  const ZebraBadge({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
