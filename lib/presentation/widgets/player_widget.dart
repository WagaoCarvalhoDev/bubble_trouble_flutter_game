import 'package:flutter/material.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({
    Key? key,
    required this.playerX,
  }) : super(key: key);

  final double playerX;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(playerX, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.purple,
          height: 50,
          width: 50,
        ),
      ),
    );
  }
}
