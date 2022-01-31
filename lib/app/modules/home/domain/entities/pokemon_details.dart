import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:pokedex/app/modules/home/data/models/pokemon_details_model.dart';

class PokemonDetails extends Equatable {
  final List<Abilitie> abilities;
  final int baseExperience;
  final List<Form> forms;
  final List<GameIndice> gameIndices;
  final int height;
  final List<dynamic> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  const PokemonDetails(
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  );

  @override
  List<Object?> get props => [
        abilities,
        baseExperience,
        forms,
        gameIndices,
        height,
        heldItems,
        id,
        isDefault,
        locationAreaEncounters,
        moves,
        name,
        order,
        pastTypes,
        species,
        sprites,
        stats,
        types,
        weight
      ];

  String get capitalizedName => name[0].toUpperCase() + name.substring(1);

  Color get color => getColorByType(types.first.type);

  String get number => '#' + id.toString().padLeft(3, '0');

  String get imageUrl =>
      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id.toString().padLeft(3, '0')}.png';
}
