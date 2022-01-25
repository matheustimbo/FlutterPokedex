import 'package:flutter/material.dart';

class PokemonTypeTag extends StatelessWidget {
  final String type;
  const PokemonTypeTag({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: Colors.white.withOpacity(
          0.2,
        ),
      ),
      child: Text(
        type,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
