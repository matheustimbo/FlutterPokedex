import 'package:flutter/material.dart';
import 'package:pokedex/app/modules/home/models/pokemon_details.dart';

class PokemonEvolutionsTab extends StatefulWidget {
  final PokemonDetails pokemon;

  const PokemonEvolutionsTab({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _PokemonEvolutionsTabState createState() => _PokemonEvolutionsTabState();
}

class _PokemonEvolutionsTabState extends State<PokemonEvolutionsTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
