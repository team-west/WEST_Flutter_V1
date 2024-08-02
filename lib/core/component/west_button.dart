import 'package:flutter/material.dart';

class WESTButton extends StatefulWidget {
  final Color backgroundColor;

  final Widget content;

  final double? height;

  const WESTButton({
    super.key,
    required this.backgroundColor,
    required this.content,
    this.height,
  });

  @override
  State<WESTButton> createState() => _WESTButtonState();
}

class _WESTButtonState extends State<WESTButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height ?? 48,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: widget.content,
    );
  }
}
