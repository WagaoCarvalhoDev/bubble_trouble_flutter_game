import 'package:flutter/material.dart';

class ButtonGameWidget extends StatelessWidget {
  const ButtonGameWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color? color;
  final Widget icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 50,
          width: 50,
          color: Colors.grey[100],
          child: icon,
        ),
      ),
    );
  }
}
