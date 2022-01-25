import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:pokedex/core/config/app_colors.dart';

class PokemonDetails {
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
  PokemonDetails({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  PokemonDetails copyWith({
    List<Abilitie>? abilities,
    int? baseExperience,
    List<Form>? forms,
    List<GameIndice>? gameIndices,
    int? height,
    List<dynamic>? heldItems,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    List<Move>? moves,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    Sprites? sprites,
    List<Stat>? stats,
    List<Type>? types,
    int? weight,
  }) {
    return PokemonDetails(
      abilities: abilities ?? this.abilities,
      baseExperience: baseExperience ?? this.baseExperience,
      forms: forms ?? this.forms,
      gameIndices: gameIndices ?? this.gameIndices,
      height: height ?? this.height,
      heldItems: heldItems ?? this.heldItems,
      id: id ?? this.id,
      isDefault: isDefault ?? this.isDefault,
      locationAreaEncounters:
          locationAreaEncounters ?? this.locationAreaEncounters,
      moves: moves ?? this.moves,
      name: name ?? this.name,
      order: order ?? this.order,
      pastTypes: pastTypes ?? this.pastTypes,
      species: species ?? this.species,
      sprites: sprites ?? this.sprites,
      stats: stats ?? this.stats,
      types: types ?? this.types,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'abilities': abilities.map((x) => x.toMap()).toList(),
      'base_experience': baseExperience,
      'forms': forms.map((x) => x.toMap()).toList(),
      'game_indices': gameIndices.map((x) => x.toMap()).toList(),
      'height': height,
      'held_items': heldItems,
      'id': id,
      'is_default': isDefault,
      'location_area_encounters': locationAreaEncounters,
      'moves': moves.map((x) => x.toMap()).toList(),
      'name': name,
      'order': order,
      'past_types': pastTypes,
      'species': species.toMap(),
      'sprites': sprites.toMap(),
      'stats': stats.map((x) => x.toMap()).toList(),
      'types': types.map((x) => x.toMap()).toList(),
      'weight': weight,
    };
  }

  factory PokemonDetails.fromMap(Map<String, dynamic> map) {
    return PokemonDetails(
      abilities: List<Abilitie>.from(
          map['abilities']?.map((x) => Abilitie.fromMap(x))),
      baseExperience: map['base_experience']?.toInt() ?? 0,
      forms: List<Form>.from(map['forms']?.map((x) => Form.fromMap(x))),
      gameIndices: List<GameIndice>.from(
          map['game_indices']?.map((x) => GameIndice.fromMap(x))),
      height: map['height']?.toInt() ?? 0,
      heldItems: List<dynamic>.from(map['held_items']),
      id: map['id']?.toInt() ?? 0,
      isDefault: map['is_default'] ?? false,
      locationAreaEncounters: map['location_area_encounters'] ?? '',
      moves: List<Move>.from(map['moves']?.map((x) => Move.fromMap(x))),
      name: map['name'] ?? '',
      order: map['order']?.toInt() ?? 0,
      pastTypes: List<dynamic>.from(map['past_types']),
      species: Species.fromMap(map['species']),
      sprites: Sprites.fromMap(map['sprites']),
      stats: List<Stat>.from(map['stats']?.map((x) => Stat.fromMap(x))),
      types: List<Type>.from(map['types']?.map((x) => Type.fromMap(x))),
      weight: map['weight']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonDetails.fromJson(String source) =>
      PokemonDetails.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonDetails(abilities: $abilities, base_experience: $baseExperience, forms: $forms, game_indices: $gameIndices, height: $height, held_items: $heldItems, id: $id, is_default: $isDefault, location_area_encounters: $locationAreaEncounters, moves: $moves, name: $name, order: $order, past_types: $pastTypes, species: $species, sprites: $sprites, stats: $stats, types: $types, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonDetails &&
        listEquals(other.abilities, abilities) &&
        other.baseExperience == baseExperience &&
        listEquals(other.forms, forms) &&
        listEquals(other.gameIndices, gameIndices) &&
        other.height == height &&
        listEquals(other.heldItems, heldItems) &&
        other.id == id &&
        other.isDefault == isDefault &&
        other.locationAreaEncounters == locationAreaEncounters &&
        listEquals(other.moves, moves) &&
        other.name == name &&
        other.order == order &&
        listEquals(other.pastTypes, pastTypes) &&
        other.species == species &&
        other.sprites == sprites &&
        listEquals(other.stats, stats) &&
        listEquals(other.types, types) &&
        other.weight == weight;
  }

  @override
  int get hashCode {
    return abilities.hashCode ^
        baseExperience.hashCode ^
        forms.hashCode ^
        gameIndices.hashCode ^
        height.hashCode ^
        heldItems.hashCode ^
        id.hashCode ^
        isDefault.hashCode ^
        locationAreaEncounters.hashCode ^
        moves.hashCode ^
        name.hashCode ^
        order.hashCode ^
        pastTypes.hashCode ^
        species.hashCode ^
        sprites.hashCode ^
        stats.hashCode ^
        types.hashCode ^
        weight.hashCode;
  }

  String get capitalizedName => name[0].toUpperCase() + name.substring(1);

  Color get color => getColorByType(types.first.type);

  String get number => '#' + id.toString().padLeft(3, '0');

  String get imageUrl =>
      'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${id.toString().padLeft(3, '0')}.png';
}

Color getColorByType(TypeListItem typeListItem) {
  switch (typeListItem.name) {
    case 'grass':
      return AppColors.lightGreen;

    case 'bug':
      return AppColors.lightTeal;

    case 'fire':
      return AppColors.lightRed;

    case 'water':
      return AppColors.lightBlue;

    case 'fighting':
      return AppColors.red;

    case 'normal':
      return AppColors.beige;

    case 'electric':
      return AppColors.lightYellow;

    case 'psychic':
      return AppColors.lightPink;

    case 'poison':
      return AppColors.lightPurple;

    case 'ghost':
      return AppColors.purple;

    case 'ground':
      return AppColors.darkBrown;

    case 'rock':
      return AppColors.lightBrown;

    case 'dark':
      return AppColors.black;

    case 'dragon':
      return AppColors.violet;

    case 'fairy':
      return AppColors.pink;

    case 'flying':
      return AppColors.lilac;

    case 'ice':
      return AppColors.lightCyan;

    case 'steel':
      return AppColors.grey;

    default:
      return AppColors.lightBlue;
  }
}

class Abilitie {
  final Ability ability;
  final bool isHidden;
  final int slot;
  Abilitie({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  Abilitie copyWith({
    Ability? ability,
    bool? isHidden,
    int? slot,
  }) {
    return Abilitie(
      ability: ability ?? this.ability,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ability': ability.toMap(),
      'is_hidden': isHidden,
      'slot': slot,
    };
  }

  factory Abilitie.fromMap(Map<String, dynamic> map) {
    return Abilitie(
      ability: Ability.fromMap(map['ability']),
      isHidden: map['is_hidden'] ?? false,
      slot: map['slot']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Abilitie.fromJson(String source) =>
      Abilitie.fromMap(json.decode(source));

  @override
  String toString() =>
      'Abilitie(ability: $ability, is_hidden: $isHidden, slot: $slot)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Abilitie &&
        other.ability == ability &&
        other.isHidden == isHidden &&
        other.slot == slot;
  }

  @override
  int get hashCode => ability.hashCode ^ isHidden.hashCode ^ slot.hashCode;
}

class Ability {
  final String name;
  final String url;
  Ability({
    required this.name,
    required this.url,
  });

  Ability copyWith({
    String? name,
    String? url,
  }) {
    return Ability(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Ability.fromJson(String source) =>
      Ability.fromMap(json.decode(source));

  @override
  String toString() => 'Ability(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ability && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Form {
  final String name;
  final String url;
  Form({
    required this.name,
    required this.url,
  });

  Form copyWith({
    String? name,
    String? url,
  }) {
    return Form(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Form.fromMap(Map<String, dynamic> map) {
    return Form(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Form.fromJson(String source) => Form.fromMap(json.decode(source));

  @override
  String toString() => 'Form(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Form && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class GameIndice {
  final int gameIndex;
  final Version version;
  GameIndice({
    required this.gameIndex,
    required this.version,
  });

  GameIndice copyWith({
    int? gameIndex,
    Version? version,
  }) {
    return GameIndice(
      gameIndex: gameIndex ?? this.gameIndex,
      version: version ?? this.version,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'game_index': gameIndex,
      'version': version.toMap(),
    };
  }

  factory GameIndice.fromMap(Map<String, dynamic> map) {
    return GameIndice(
      gameIndex: map['game_index']?.toInt() ?? 0,
      version: Version.fromMap(map['version']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GameIndice.fromJson(String source) =>
      GameIndice.fromMap(json.decode(source));

  @override
  String toString() => 'Game_indice(game_index: $gameIndex, version: $version)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameIndice &&
        other.gameIndex == gameIndex &&
        other.version == version;
  }

  @override
  int get hashCode => gameIndex.hashCode ^ version.hashCode;
}

class Version {
  final String name;
  final String url;
  Version({
    required this.name,
    required this.url,
  });

  Version copyWith({
    String? name,
    String? url,
  }) {
    return Version(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Version.fromMap(Map<String, dynamic> map) {
    return Version(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Version.fromJson(String source) =>
      Version.fromMap(json.decode(source));

  @override
  String toString() => 'Version(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Version && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Move {
  final MoveListItem move;
  final List<VersionGroupDetail> versionGroupDetails;
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  Move copyWith({
    MoveListItem? move,
    List<VersionGroupDetail>? versionGroupDetails,
  }) {
    return Move(
      move: move ?? this.move,
      versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'move': move.toMap(),
      'version_group_details':
          versionGroupDetails.map((x) => x.toMap()).toList(),
    };
  }

  factory Move.fromMap(Map<String, dynamic> map) {
    return Move(
      move: MoveListItem.fromMap(map['move']),
      versionGroupDetails: List<VersionGroupDetail>.from(
          map['version_group_details']
              ?.map((x) => VersionGroupDetail.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Move.fromJson(String source) => Move.fromMap(json.decode(source));

  @override
  String toString() =>
      'Move(move: $move, version_group_details: $versionGroupDetails)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Move &&
        other.move == move &&
        listEquals(other.versionGroupDetails, versionGroupDetails);
  }

  @override
  int get hashCode => move.hashCode ^ versionGroupDetails.hashCode;
}

class MoveListItem {
  final String name;
  final String url;
  MoveListItem({
    required this.name,
    required this.url,
  });

  MoveListItem copyWith({
    String? name,
    String? url,
  }) {
    return MoveListItem(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory MoveListItem.fromMap(Map<String, dynamic> map) {
    return MoveListItem(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveListItem.fromJson(String source) =>
      MoveListItem.fromMap(json.decode(source));

  @override
  String toString() => 'Move(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveListItem && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class VersionGroupDetail {
  final int levelLearnedAt;
  final MoveLearnMethod moveLearnMethod;
  final VersionGroup versionGroup;
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  VersionGroupDetail copyWith({
    int? levelLearnedAt,
    MoveLearnMethod? moveLearnMethod,
    VersionGroup? versionGroup,
  }) {
    return VersionGroupDetail(
      levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
      moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      versionGroup: versionGroup ?? this.versionGroup,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'level_learned_at': levelLearnedAt,
      'move_learn_method': moveLearnMethod.toMap(),
      'version_group': versionGroup.toMap(),
    };
  }

  factory VersionGroupDetail.fromMap(Map<String, dynamic> map) {
    return VersionGroupDetail(
      levelLearnedAt: map['level_learned_at']?.toInt() ?? 0,
      moveLearnMethod: MoveLearnMethod.fromMap(map['move_learn_method']),
      versionGroup: VersionGroup.fromMap(map['version_group']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionGroupDetail.fromJson(String source) =>
      VersionGroupDetail.fromMap(json.decode(source));

  @override
  String toString() =>
      'Version_group_detail(level_learned_at: $levelLearnedAt, move_learn_method: $moveLearnMethod, version_group: $versionGroup)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionGroupDetail &&
        other.levelLearnedAt == levelLearnedAt &&
        other.moveLearnMethod == moveLearnMethod &&
        other.versionGroup == versionGroup;
  }

  @override
  int get hashCode =>
      levelLearnedAt.hashCode ^
      moveLearnMethod.hashCode ^
      versionGroup.hashCode;
}

class MoveLearnMethod {
  final String name;
  final String url;
  MoveLearnMethod({
    required this.name,
    required this.url,
  });

  MoveLearnMethod copyWith({
    String? name,
    String? url,
  }) {
    return MoveLearnMethod(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory MoveLearnMethod.fromMap(Map<String, dynamic> map) {
    return MoveLearnMethod(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoveLearnMethod.fromJson(String source) =>
      MoveLearnMethod.fromMap(json.decode(source));

  @override
  String toString() => 'Move_learn_method(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoveLearnMethod && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class VersionGroup {
  final String name;
  final String url;
  VersionGroup({
    required this.name,
    required this.url,
  });

  VersionGroup copyWith({
    String? name,
    String? url,
  }) {
    return VersionGroup(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory VersionGroup.fromMap(Map<String, dynamic> map) {
    return VersionGroup(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VersionGroup.fromJson(String source) =>
      VersionGroup.fromMap(json.decode(source));

  @override
  String toString() => 'Version_group(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VersionGroup && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Species {
  final String name;
  final String url;
  Species({
    required this.name,
    required this.url,
  });

  Species copyWith({
    String? name,
    String? url,
  }) {
    return Species(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Species.fromMap(Map<String, dynamic> map) {
    return Species(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Species.fromJson(String source) =>
      Species.fromMap(json.decode(source));

  @override
  String toString() => 'Species(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Species && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Sprites {
  final String backDefault;
  final String backFemale;
  final String backShiny;
  final String backShinyFemale;
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  final Other other;
  final Versions versions;
  Sprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
    required this.versions,
  });

  Sprites copyWith({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
    Other? other,
    Versions? versions,
  }) {
    return Sprites(
      backDefault: backDefault ?? this.backDefault,
      backFemale: backFemale ?? this.backFemale,
      backShiny: backShiny ?? this.backShiny,
      backShinyFemale: backShinyFemale ?? this.backShinyFemale,
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
      other: other ?? this.other,
      versions: versions ?? this.versions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': backDefault,
      'back_female': backFemale,
      'back_shiny': backShiny,
      'back_shiny_female': backShinyFemale,
      'front_default': frontDefault,
      'front_female': frontFemale,
      'front_shiny': frontShiny,
      'front_shiny_female': frontShinyFemale,
      'other': other.toMap(),
      'versions': versions.toMap(),
    };
  }

  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      backDefault: map['back_default'] ?? '',
      backFemale: map['back_female'] ?? '',
      backShiny: map['back_shiny'] ?? '',
      backShinyFemale: map['back_shiny_female'] ?? '',
      frontDefault: map['front_default'] ?? '',
      frontFemale: map['front_female'] ?? '',
      frontShiny: map['front_shiny'] ?? '',
      frontShinyFemale: map['front_shiny_female'] ?? '',
      other: Other.fromMap(map['other']),
      versions: Versions.fromMap(map['versions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sprites.fromJson(String source) =>
      Sprites.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sprites(back_default: $backDefault, back_female: $backFemale, back_shiny: $backShiny, back_shiny_female: $backShinyFemale, front_default: $frontDefault, front_female: $frontFemale, front_shiny: $frontShiny, front_shiny_female: $frontShinyFemale, other: $other, versions: $versions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sprites &&
        other.backDefault == backDefault &&
        other.backFemale == backFemale &&
        other.backShiny == backShiny &&
        other.backShinyFemale == backShinyFemale &&
        other.frontDefault == frontDefault &&
        other.frontFemale == frontFemale &&
        other.frontShiny == frontShiny &&
        other.frontShinyFemale == frontShinyFemale &&
        other.other == other &&
        other.versions == versions;
  }

  @override
  int get hashCode {
    return backDefault.hashCode ^
        backFemale.hashCode ^
        backShiny.hashCode ^
        backShinyFemale.hashCode ^
        frontDefault.hashCode ^
        frontFemale.hashCode ^
        frontShiny.hashCode ^
        frontShinyFemale.hashCode ^
        other.hashCode ^
        versions.hashCode;
  }
}

class Other {
  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;
  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  Other copyWith({
    DreamWorld? dreamWorld,
    Home? home,
    OfficialArtwork? officialArtwork,
  }) {
    return Other(
      dreamWorld: dreamWorld ?? this.dreamWorld,
      home: home ?? this.home,
      officialArtwork: officialArtwork ?? this.officialArtwork,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dream_world': dreamWorld.toMap(),
      'home': home.toMap(),
      'official-artwork': officialArtwork.toMap(),
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      dreamWorld: DreamWorld.fromMap(map['dream_world']),
      home: Home.fromMap(map['home']),
      officialArtwork: OfficialArtwork.fromMap(map['official-artwork']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) => Other.fromMap(json.decode(source));

  @override
  String toString() =>
      'Other(dream_world: $dreamWorld, home: $home, officialArtwork: $officialArtwork)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Other &&
        other.dreamWorld == dreamWorld &&
        other.home == home &&
        other.officialArtwork == officialArtwork;
  }

  @override
  int get hashCode =>
      dreamWorld.hashCode ^ home.hashCode ^ officialArtwork.hashCode;
}

class DreamWorld {
  final String frontDefault;
  final String frontFemale;
  DreamWorld({
    required this.frontDefault,
    required this.frontFemale,
  });

  DreamWorld copyWith({
    String? frontDefault,
    String? frontFemale,
  }) {
    return DreamWorld(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontDefault,
      'front_female': frontFemale,
    };
  }

  factory DreamWorld.fromMap(Map<String, dynamic> map) {
    return DreamWorld(
      frontDefault: map['front_default'] ?? '',
      frontFemale: map['front_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DreamWorld.fromJson(String source) =>
      DreamWorld.fromMap(json.decode(source));

  @override
  String toString() =>
      'Dream_world(front_default: $frontDefault, front_female: $frontFemale)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DreamWorld &&
        other.frontDefault == frontDefault &&
        other.frontFemale == frontFemale;
  }

  @override
  int get hashCode => frontDefault.hashCode ^ frontFemale.hashCode;
}

class Home {
  final String frontDefault;
  final String frontFemale;
  final String frontShiny;
  final String frontShinyFemale;
  Home({
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
  });

  Home copyWith({
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
  }) {
    return Home(
      frontDefault: frontDefault ?? this.frontDefault,
      frontFemale: frontFemale ?? this.frontFemale,
      frontShiny: frontShiny ?? this.frontShiny,
      frontShinyFemale: frontShinyFemale ?? this.frontShinyFemale,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontDefault,
      'front_female': frontFemale,
      'front_shiny': frontShiny,
      'front_shiny_female': frontShinyFemale,
    };
  }

  factory Home.fromMap(Map<String, dynamic> map) {
    return Home(
      frontDefault: map['front_default'] ?? '',
      frontFemale: map['front_female'] ?? '',
      frontShiny: map['front_shiny'] ?? '',
      frontShinyFemale: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Home.fromJson(String source) => Home.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Home(front_default: $frontDefault, front_female: $frontFemale, front_shiny: $frontShiny, front_shiny_female: $frontShinyFemale)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Home &&
        other.frontDefault == frontDefault &&
        other.frontFemale == frontFemale &&
        other.frontShiny == frontShiny &&
        other.frontShinyFemale == frontShinyFemale;
  }

  @override
  int get hashCode {
    return frontDefault.hashCode ^
        frontFemale.hashCode ^
        frontShiny.hashCode ^
        frontShinyFemale.hashCode;
  }
}

class OfficialArtwork {
  final String frontDefault;
  OfficialArtwork({
    required this.frontDefault,
  });

  OfficialArtwork copyWith({
    String? frontDefault,
  }) {
    return OfficialArtwork(
      frontDefault: frontDefault ?? this.frontDefault,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': frontDefault,
    };
  }

  factory OfficialArtwork.fromMap(Map<String, dynamic> map) {
    return OfficialArtwork(
      frontDefault: map['front_default'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficialArtwork.fromJson(String source) =>
      OfficialArtwork.fromMap(json.decode(source));

  @override
  String toString() => 'Official-artwork(front_default: $frontDefault)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OfficialArtwork && other.frontDefault == frontDefault;
  }

  @override
  int get hashCode => frontDefault.hashCode;
}

class Versions {
  final GenerationI generationI;
  final GenerationIi generationIi;
  final GenerationIii generationIii;
  final GenerationIv generationIv;
  final GenerationV generationV;
  final GenerationVi generationVi;
  final GenerationVii generationVii;
  final GenerationViii generationViii;
  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  Versions copyWith({
    GenerationI? generationI,
    GenerationIi? generationIi,
    GenerationIii? generationIii,
    GenerationIv? generationIv,
    GenerationV? generationV,
    GenerationVi? generationVi,
    GenerationVii? generationVii,
    GenerationViii? generationViii,
  }) {
    return Versions(
      generationI: generationI ?? this.generationI,
      generationIi: generationIi ?? this.generationIi,
      generationIii: generationIii ?? this.generationIii,
      generationIv: generationIv ?? this.generationIv,
      generationV: generationV ?? this.generationV,
      generationVi: generationVi ?? this.generationVi,
      generationVii: generationVii ?? this.generationVii,
      generationViii: generationViii ?? this.generationViii,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'generation-i': generationI.toMap(),
      'generation-ii': generationIi.toMap(),
      'generation-iii': generationIii.toMap(),
      'generation-iv': generationIv.toMap(),
      'generation-v': generationV.toMap(),
      'generation-vi': generationVi.toMap(),
      'generation-vii': generationVii.toMap(),
      'generation-viii': generationViii.toMap(),
    };
  }

  factory Versions.fromMap(Map<String, dynamic> map) {
    return Versions(
      generationI: GenerationI.fromMap(map['generation-i']),
      generationIi: GenerationIi.fromMap(map['generation-ii']),
      generationIii: GenerationIii.fromMap(map['generation-iii']),
      generationIv: GenerationIv.fromMap(map['generation-iv']),
      generationV: GenerationV.fromMap(map['generation-v']),
      generationVi: GenerationVi.fromMap(map['generation-vi']),
      generationVii: GenerationVii.fromMap(map['generation-vii']),
      generationViii: GenerationViii.fromMap(map['generation-viii']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Versions.fromJson(String source) =>
      Versions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Versions(generationI: $generationI, generationIi: $generationIi, generationIii: $generationIii, generationIv: $generationIv, generationV: $generationV, generationVi: $generationVi, generationVii: $generationVii, generationViii: $generationViii)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Versions &&
        other.generationI == generationI &&
        other.generationIi == generationIi &&
        other.generationIii == generationIii &&
        other.generationIv == generationIv &&
        other.generationV == generationV &&
        other.generationVi == generationVi &&
        other.generationVii == generationVii &&
        other.generationViii == generationViii;
  }

  @override
  int get hashCode {
    return generationI.hashCode ^
        generationIi.hashCode ^
        generationIii.hashCode ^
        generationIv.hashCode ^
        generationV.hashCode ^
        generationVi.hashCode ^
        generationVii.hashCode ^
        generationViii.hashCode;
  }
}

class GenerationI {
  final RedBlue redBlue;
  final Yellow yellow;
  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  GenerationI copyWith({
    RedBlue? redBlue,
    Yellow? yellow,
  }) {
    return GenerationI(
      redBlue: redBlue ?? this.redBlue,
      yellow: yellow ?? this.yellow,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'red-blue': redBlue.toMap(),
      'yellow': yellow.toMap(),
    };
  }

  factory GenerationI.fromMap(Map<String, dynamic> map) {
    return GenerationI(
      redBlue: RedBlue.fromMap(map['red-blue']),
      yellow: Yellow.fromMap(map['yellow']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationI.fromJson(String source) =>
      GenerationI.fromMap(json.decode(source));

  @override
  String toString() => 'Generation-i(redBlue: $redBlue, yellow: $yellow)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationI &&
        other.redBlue == redBlue &&
        other.yellow == yellow;
  }

  @override
  int get hashCode => redBlue.hashCode ^ yellow.hashCode;
}

class RedBlue {
  final String back_default;
  final String back_gray;
  final String back_transparent;
  final String front_default;
  final String front_gray;
  final String front_transparent;
  RedBlue({
    required this.back_default,
    required this.back_gray,
    required this.back_transparent,
    required this.front_default,
    required this.front_gray,
    required this.front_transparent,
  });

  RedBlue copyWith({
    String? back_default,
    String? back_gray,
    String? back_transparent,
    String? front_default,
    String? front_gray,
    String? front_transparent,
  }) {
    return RedBlue(
      back_default: back_default ?? this.back_default,
      back_gray: back_gray ?? this.back_gray,
      back_transparent: back_transparent ?? this.back_transparent,
      front_default: front_default ?? this.front_default,
      front_gray: front_gray ?? this.front_gray,
      front_transparent: front_transparent ?? this.front_transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_gray': back_gray,
      'back_transparent': back_transparent,
      'front_default': front_default,
      'front_gray': front_gray,
      'front_transparent': front_transparent,
    };
  }

  factory RedBlue.fromMap(Map<String, dynamic> map) {
    return RedBlue(
      back_default: map['back_default'] ?? '',
      back_gray: map['back_gray'] ?? '',
      back_transparent: map['back_transparent'] ?? '',
      front_default: map['front_default'] ?? '',
      front_gray: map['front_gray'] ?? '',
      front_transparent: map['front_transparent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RedBlue.fromJson(String source) =>
      RedBlue.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Red-blue(back_default: $back_default, back_gray: $back_gray, back_transparent: $back_transparent, front_default: $front_default, front_gray: $front_gray, front_transparent: $front_transparent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RedBlue &&
        other.back_default == back_default &&
        other.back_gray == back_gray &&
        other.back_transparent == back_transparent &&
        other.front_default == front_default &&
        other.front_gray == front_gray &&
        other.front_transparent == front_transparent;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_gray.hashCode ^
        back_transparent.hashCode ^
        front_default.hashCode ^
        front_gray.hashCode ^
        front_transparent.hashCode;
  }
}

class Yellow {
  final String back_default;
  final String back_gray;
  final String back_transparent;
  final String front_default;
  final String front_gray;
  final String front_transparent;
  Yellow({
    required this.back_default,
    required this.back_gray,
    required this.back_transparent,
    required this.front_default,
    required this.front_gray,
    required this.front_transparent,
  });

  Yellow copyWith({
    String? back_default,
    String? back_gray,
    String? back_transparent,
    String? front_default,
    String? front_gray,
    String? front_transparent,
  }) {
    return Yellow(
      back_default: back_default ?? this.back_default,
      back_gray: back_gray ?? this.back_gray,
      back_transparent: back_transparent ?? this.back_transparent,
      front_default: front_default ?? this.front_default,
      front_gray: front_gray ?? this.front_gray,
      front_transparent: front_transparent ?? this.front_transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_gray': back_gray,
      'back_transparent': back_transparent,
      'front_default': front_default,
      'front_gray': front_gray,
      'front_transparent': front_transparent,
    };
  }

  factory Yellow.fromMap(Map<String, dynamic> map) {
    return Yellow(
      back_default: map['back_default'] ?? '',
      back_gray: map['back_gray'] ?? '',
      back_transparent: map['back_transparent'] ?? '',
      front_default: map['front_default'] ?? '',
      front_gray: map['front_gray'] ?? '',
      front_transparent: map['front_transparent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Yellow.fromJson(String source) => Yellow.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Yellow(back_default: $back_default, back_gray: $back_gray, back_transparent: $back_transparent, front_default: $front_default, front_gray: $front_gray, front_transparent: $front_transparent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Yellow &&
        other.back_default == back_default &&
        other.back_gray == back_gray &&
        other.back_transparent == back_transparent &&
        other.front_default == front_default &&
        other.front_gray == front_gray &&
        other.front_transparent == front_transparent;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_gray.hashCode ^
        back_transparent.hashCode ^
        front_default.hashCode ^
        front_gray.hashCode ^
        front_transparent.hashCode;
  }
}

class GenerationIi {
  final Crystal crystal;
  final Gold gold;
  final Silver silver;
  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  GenerationIi copyWith({
    Crystal? crystal,
    Gold? gold,
    Silver? silver,
  }) {
    return GenerationIi(
      crystal: crystal ?? this.crystal,
      gold: gold ?? this.gold,
      silver: silver ?? this.silver,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'crystal': crystal.toMap(),
      'gold': gold.toMap(),
      'silver': silver.toMap(),
    };
  }

  factory GenerationIi.fromMap(Map<String, dynamic> map) {
    return GenerationIi(
      crystal: Crystal.fromMap(map['crystal']),
      gold: Gold.fromMap(map['gold']),
      silver: Silver.fromMap(map['silver']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationIi.fromJson(String source) =>
      GenerationIi.fromMap(json.decode(source));

  @override
  String toString() =>
      'Generation-ii(crystal: $crystal, gold: $gold, silver: $silver)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationIi &&
        other.crystal == crystal &&
        other.gold == gold &&
        other.silver == silver;
  }

  @override
  int get hashCode => crystal.hashCode ^ gold.hashCode ^ silver.hashCode;
}

class Crystal {
  final String back_default;
  final String back_shiny;
  final String back_shiny_transparent;
  final String back_transparent;
  final String front_default;
  final String front_shiny;
  final String front_shiny_transparent;
  final String front_transparent;
  Crystal({
    required this.back_default,
    required this.back_shiny,
    required this.back_shiny_transparent,
    required this.back_transparent,
    required this.front_default,
    required this.front_shiny,
    required this.front_shiny_transparent,
    required this.front_transparent,
  });

  Crystal copyWith({
    String? back_default,
    String? back_shiny,
    String? back_shiny_transparent,
    String? back_transparent,
    String? front_default,
    String? front_shiny,
    String? front_shiny_transparent,
    String? front_transparent,
  }) {
    return Crystal(
      back_default: back_default ?? this.back_default,
      back_shiny: back_shiny ?? this.back_shiny,
      back_shiny_transparent:
          back_shiny_transparent ?? this.back_shiny_transparent,
      back_transparent: back_transparent ?? this.back_transparent,
      front_default: front_default ?? this.front_default,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_transparent:
          front_shiny_transparent ?? this.front_shiny_transparent,
      front_transparent: front_transparent ?? this.front_transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_shiny': back_shiny,
      'back_shiny_transparent': back_shiny_transparent,
      'back_transparent': back_transparent,
      'front_default': front_default,
      'front_shiny': front_shiny,
      'front_shiny_transparent': front_shiny_transparent,
      'front_transparent': front_transparent,
    };
  }

  factory Crystal.fromMap(Map<String, dynamic> map) {
    return Crystal(
      back_default: map['back_default'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      back_shiny_transparent: map['back_shiny_transparent'] ?? '',
      back_transparent: map['back_transparent'] ?? '',
      front_default: map['front_default'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_transparent: map['front_shiny_transparent'] ?? '',
      front_transparent: map['front_transparent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Crystal.fromJson(String source) =>
      Crystal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Crystal(back_default: $back_default, back_shiny: $back_shiny, back_shiny_transparent: $back_shiny_transparent, back_transparent: $back_transparent, front_default: $front_default, front_shiny: $front_shiny, front_shiny_transparent: $front_shiny_transparent, front_transparent: $front_transparent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Crystal &&
        other.back_default == back_default &&
        other.back_shiny == back_shiny &&
        other.back_shiny_transparent == back_shiny_transparent &&
        other.back_transparent == back_transparent &&
        other.front_default == front_default &&
        other.front_shiny == front_shiny &&
        other.front_shiny_transparent == front_shiny_transparent &&
        other.front_transparent == front_transparent;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_shiny.hashCode ^
        back_shiny_transparent.hashCode ^
        back_transparent.hashCode ^
        front_default.hashCode ^
        front_shiny.hashCode ^
        front_shiny_transparent.hashCode ^
        front_transparent.hashCode;
  }
}

class Gold {
  final String back_default;
  final String back_shiny;
  final String front_default;
  final String front_shiny;
  final String front_transparent;
  Gold({
    required this.back_default,
    required this.back_shiny,
    required this.front_default,
    required this.front_shiny,
    required this.front_transparent,
  });

  Gold copyWith({
    String? back_default,
    String? back_shiny,
    String? front_default,
    String? front_shiny,
    String? front_transparent,
  }) {
    return Gold(
      back_default: back_default ?? this.back_default,
      back_shiny: back_shiny ?? this.back_shiny,
      front_default: front_default ?? this.front_default,
      front_shiny: front_shiny ?? this.front_shiny,
      front_transparent: front_transparent ?? this.front_transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_shiny': back_shiny,
      'front_default': front_default,
      'front_shiny': front_shiny,
      'front_transparent': front_transparent,
    };
  }

  factory Gold.fromMap(Map<String, dynamic> map) {
    return Gold(
      back_default: map['back_default'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      front_default: map['front_default'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_transparent: map['front_transparent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Gold.fromJson(String source) => Gold.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Gold(back_default: $back_default, back_shiny: $back_shiny, front_default: $front_default, front_shiny: $front_shiny, front_transparent: $front_transparent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Gold &&
        other.back_default == back_default &&
        other.back_shiny == back_shiny &&
        other.front_default == front_default &&
        other.front_shiny == front_shiny &&
        other.front_transparent == front_transparent;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_shiny.hashCode ^
        front_default.hashCode ^
        front_shiny.hashCode ^
        front_transparent.hashCode;
  }
}

class Silver {
  final String back_default;
  final String back_shiny;
  final String front_default;
  final String front_shiny;
  final String front_transparent;
  Silver({
    required this.back_default,
    required this.back_shiny,
    required this.front_default,
    required this.front_shiny,
    required this.front_transparent,
  });

  Silver copyWith({
    String? back_default,
    String? back_shiny,
    String? front_default,
    String? front_shiny,
    String? front_transparent,
  }) {
    return Silver(
      back_default: back_default ?? this.back_default,
      back_shiny: back_shiny ?? this.back_shiny,
      front_default: front_default ?? this.front_default,
      front_shiny: front_shiny ?? this.front_shiny,
      front_transparent: front_transparent ?? this.front_transparent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_shiny': back_shiny,
      'front_default': front_default,
      'front_shiny': front_shiny,
      'front_transparent': front_transparent,
    };
  }

  factory Silver.fromMap(Map<String, dynamic> map) {
    return Silver(
      back_default: map['back_default'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      front_default: map['front_default'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_transparent: map['front_transparent'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Silver.fromJson(String source) => Silver.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Silver(back_default: $back_default, back_shiny: $back_shiny, front_default: $front_default, front_shiny: $front_shiny, front_transparent: $front_transparent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Silver &&
        other.back_default == back_default &&
        other.back_shiny == back_shiny &&
        other.front_default == front_default &&
        other.front_shiny == front_shiny &&
        other.front_transparent == front_transparent;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_shiny.hashCode ^
        front_default.hashCode ^
        front_shiny.hashCode ^
        front_transparent.hashCode;
  }
}

class GenerationIii {
  final Emerald emerald;
  final FireredLeafgreen fireredLeafgreen;
  final RubySapphire rubySapphire;
  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  GenerationIii copyWith({
    Emerald? emerald,
    FireredLeafgreen? fireredLeafgreen,
    RubySapphire? rubySapphire,
  }) {
    return GenerationIii(
      emerald: emerald ?? this.emerald,
      fireredLeafgreen: fireredLeafgreen ?? this.fireredLeafgreen,
      rubySapphire: rubySapphire ?? this.rubySapphire,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emerald': emerald.toMap(),
      'firered-leafgreen': fireredLeafgreen.toMap(),
      'ruby-sapphire': rubySapphire.toMap(),
    };
  }

  factory GenerationIii.fromMap(Map<String, dynamic> map) {
    return GenerationIii(
      emerald: Emerald.fromMap(map['emerald']),
      fireredLeafgreen: FireredLeafgreen.fromMap(map['firered-leafgreen']),
      rubySapphire: RubySapphire.fromMap(map['ruby-sapphire']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationIii.fromJson(String source) =>
      GenerationIii.fromMap(json.decode(source));

  @override
  String toString() =>
      'Generation-iii(emerald: $emerald, fireredLeafgreen: $fireredLeafgreen, rubySapphire: $rubySapphire)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationIii &&
        other.emerald == emerald &&
        other.fireredLeafgreen == fireredLeafgreen &&
        other.rubySapphire == rubySapphire;
  }

  @override
  int get hashCode =>
      emerald.hashCode ^ fireredLeafgreen.hashCode ^ rubySapphire.hashCode;
}

class Emerald {
  final String front_default;
  final String front_shiny;
  Emerald({
    required this.front_default,
    required this.front_shiny,
  });

  Emerald copyWith({
    String? front_default,
    String? front_shiny,
  }) {
    return Emerald(
      front_default: front_default ?? this.front_default,
      front_shiny: front_shiny ?? this.front_shiny,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': front_default,
      'front_shiny': front_shiny,
    };
  }

  factory Emerald.fromMap(Map<String, dynamic> map) {
    return Emerald(
      front_default: map['front_default'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Emerald.fromJson(String source) =>
      Emerald.fromMap(json.decode(source));

  @override
  String toString() =>
      'Emerald(front_default: $front_default, front_shiny: $front_shiny)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Emerald &&
        other.front_default == front_default &&
        other.front_shiny == front_shiny;
  }

  @override
  int get hashCode => front_default.hashCode ^ front_shiny.hashCode;
}

class FireredLeafgreen {
  final String back_default;
  final String back_shiny;
  final String front_default;
  final String front_shiny;
  FireredLeafgreen({
    required this.back_default,
    required this.back_shiny,
    required this.front_default,
    required this.front_shiny,
  });

  FireredLeafgreen copyWith({
    String? back_default,
    String? back_shiny,
    String? front_default,
    String? front_shiny,
  }) {
    return FireredLeafgreen(
      back_default: back_default ?? this.back_default,
      back_shiny: back_shiny ?? this.back_shiny,
      front_default: front_default ?? this.front_default,
      front_shiny: front_shiny ?? this.front_shiny,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_shiny': back_shiny,
      'front_default': front_default,
      'front_shiny': front_shiny,
    };
  }

  factory FireredLeafgreen.fromMap(Map<String, dynamic> map) {
    return FireredLeafgreen(
      back_default: map['back_default'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      front_default: map['front_default'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FireredLeafgreen.fromJson(String source) =>
      FireredLeafgreen.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Firered-leafgreen(back_default: $back_default, back_shiny: $back_shiny, front_default: $front_default, front_shiny: $front_shiny)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FireredLeafgreen &&
        other.back_default == back_default &&
        other.back_shiny == back_shiny &&
        other.front_default == front_default &&
        other.front_shiny == front_shiny;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_shiny.hashCode ^
        front_default.hashCode ^
        front_shiny.hashCode;
  }
}

class RubySapphire {
  final String back_default;
  final String back_shiny;
  final String front_default;
  final String front_shiny;
  RubySapphire({
    required this.back_default,
    required this.back_shiny,
    required this.front_default,
    required this.front_shiny,
  });

  RubySapphire copyWith({
    String? back_default,
    String? back_shiny,
    String? front_default,
    String? front_shiny,
  }) {
    return RubySapphire(
      back_default: back_default ?? this.back_default,
      back_shiny: back_shiny ?? this.back_shiny,
      front_default: front_default ?? this.front_default,
      front_shiny: front_shiny ?? this.front_shiny,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_shiny': back_shiny,
      'front_default': front_default,
      'front_shiny': front_shiny,
    };
  }

  factory RubySapphire.fromMap(Map<String, dynamic> map) {
    return RubySapphire(
      back_default: map['back_default'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      front_default: map['front_default'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RubySapphire.fromJson(String source) =>
      RubySapphire.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ruby-sapphire(back_default: $back_default, back_shiny: $back_shiny, front_default: $front_default, front_shiny: $front_shiny)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RubySapphire &&
        other.back_default == back_default &&
        other.back_shiny == back_shiny &&
        other.front_default == front_default &&
        other.front_shiny == front_shiny;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_shiny.hashCode ^
        front_default.hashCode ^
        front_shiny.hashCode;
  }
}

class GenerationIv {
  final DiamondPearl diamondPearl;
  final HeartgoldSoulsilver heartgoldSoulsilver;
  final Platinum platinum;
  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  GenerationIv copyWith({
    DiamondPearl? diamondPearl,
    HeartgoldSoulsilver? heartgoldSoulsilver,
    Platinum? platinum,
  }) {
    return GenerationIv(
      diamondPearl: diamondPearl ?? this.diamondPearl,
      heartgoldSoulsilver: heartgoldSoulsilver ?? this.heartgoldSoulsilver,
      platinum: platinum ?? this.platinum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diamond-pearl': diamondPearl.toMap(),
      'heartgold-soulsilver': heartgoldSoulsilver.toMap(),
      'platinum': platinum.toMap(),
    };
  }

  factory GenerationIv.fromMap(Map<String, dynamic> map) {
    return GenerationIv(
      diamondPearl: DiamondPearl.fromMap(map['diamond-pearl']),
      heartgoldSoulsilver:
          HeartgoldSoulsilver.fromMap(map['heartgold-soulsilver']),
      platinum: Platinum.fromMap(map['platinum']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationIv.fromJson(String source) =>
      GenerationIv.fromMap(json.decode(source));

  @override
  String toString() =>
      'Generation-iv(diamondPearl: $diamondPearl, heartgoldSoulsilver: $heartgoldSoulsilver, platinum: $platinum)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationIv &&
        other.diamondPearl == diamondPearl &&
        other.heartgoldSoulsilver == heartgoldSoulsilver &&
        other.platinum == platinum;
  }

  @override
  int get hashCode =>
      diamondPearl.hashCode ^ heartgoldSoulsilver.hashCode ^ platinum.hashCode;
}

class DiamondPearl {
  final String back_default;
  final String back_female;
  final String back_shiny;
  final String back_shiny_female;
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  DiamondPearl({
    required this.back_default,
    required this.back_female,
    required this.back_shiny,
    required this.back_shiny_female,
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  DiamondPearl copyWith({
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return DiamondPearl(
      back_default: back_default ?? this.back_default,
      back_female: back_female ?? this.back_female,
      back_shiny: back_shiny ?? this.back_shiny,
      back_shiny_female: back_shiny_female ?? this.back_shiny_female,
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_female': back_female,
      'back_shiny': back_shiny,
      'back_shiny_female': back_shiny_female,
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory DiamondPearl.fromMap(Map<String, dynamic> map) {
    return DiamondPearl(
      back_default: map['back_default'] ?? '',
      back_female: map['back_female'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      back_shiny_female: map['back_shiny_female'] ?? '',
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DiamondPearl.fromJson(String source) =>
      DiamondPearl.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Diamond-pearl(back_default: $back_default, back_female: $back_female, back_shiny: $back_shiny, back_shiny_female: $back_shiny_female, front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DiamondPearl &&
        other.back_default == back_default &&
        other.back_female == back_female &&
        other.back_shiny == back_shiny &&
        other.back_shiny_female == back_shiny_female &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_female.hashCode ^
        back_shiny.hashCode ^
        back_shiny_female.hashCode ^
        front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class HeartgoldSoulsilver {
  final String back_default;
  final String back_female;
  final String back_shiny;
  final String back_shiny_female;
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  HeartgoldSoulsilver({
    required this.back_default,
    required this.back_female,
    required this.back_shiny,
    required this.back_shiny_female,
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  HeartgoldSoulsilver copyWith({
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return HeartgoldSoulsilver(
      back_default: back_default ?? this.back_default,
      back_female: back_female ?? this.back_female,
      back_shiny: back_shiny ?? this.back_shiny,
      back_shiny_female: back_shiny_female ?? this.back_shiny_female,
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_female': back_female,
      'back_shiny': back_shiny,
      'back_shiny_female': back_shiny_female,
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory HeartgoldSoulsilver.fromMap(Map<String, dynamic> map) {
    return HeartgoldSoulsilver(
      back_default: map['back_default'] ?? '',
      back_female: map['back_female'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      back_shiny_female: map['back_shiny_female'] ?? '',
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HeartgoldSoulsilver.fromJson(String source) =>
      HeartgoldSoulsilver.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Heartgold-soulsilver(back_default: $back_default, back_female: $back_female, back_shiny: $back_shiny, back_shiny_female: $back_shiny_female, front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HeartgoldSoulsilver &&
        other.back_default == back_default &&
        other.back_female == back_female &&
        other.back_shiny == back_shiny &&
        other.back_shiny_female == back_shiny_female &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_female.hashCode ^
        back_shiny.hashCode ^
        back_shiny_female.hashCode ^
        front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class Platinum {
  final String back_default;
  final String back_female;
  final String back_shiny;
  final String back_shiny_female;
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  Platinum({
    required this.back_default,
    required this.back_female,
    required this.back_shiny,
    required this.back_shiny_female,
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  Platinum copyWith({
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return Platinum(
      back_default: back_default ?? this.back_default,
      back_female: back_female ?? this.back_female,
      back_shiny: back_shiny ?? this.back_shiny,
      back_shiny_female: back_shiny_female ?? this.back_shiny_female,
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_female': back_female,
      'back_shiny': back_shiny,
      'back_shiny_female': back_shiny_female,
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory Platinum.fromMap(Map<String, dynamic> map) {
    return Platinum(
      back_default: map['back_default'] ?? '',
      back_female: map['back_female'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      back_shiny_female: map['back_shiny_female'] ?? '',
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Platinum.fromJson(String source) =>
      Platinum.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Platinum(back_default: $back_default, back_female: $back_female, back_shiny: $back_shiny, back_shiny_female: $back_shiny_female, front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Platinum &&
        other.back_default == back_default &&
        other.back_female == back_female &&
        other.back_shiny == back_shiny &&
        other.back_shiny_female == back_shiny_female &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_female.hashCode ^
        back_shiny.hashCode ^
        back_shiny_female.hashCode ^
        front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class GenerationV {
  final BlackWhite blackWhite;
  GenerationV({
    required this.blackWhite,
  });

  GenerationV copyWith({
    BlackWhite? blackWhite,
  }) {
    return GenerationV(
      blackWhite: blackWhite ?? this.blackWhite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'black-white': blackWhite.toMap(),
    };
  }

  factory GenerationV.fromMap(Map<String, dynamic> map) {
    return GenerationV(
      blackWhite: BlackWhite.fromMap(map['black-white']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationV.fromJson(String source) =>
      GenerationV.fromMap(json.decode(source));

  @override
  String toString() => 'Generation-v(blackWhite: $blackWhite)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationV && other.blackWhite == blackWhite;
  }

  @override
  int get hashCode => blackWhite.hashCode;
}

class BlackWhite {
  final Animated animated;
  final String back_default;
  final String back_female;
  final String back_shiny;
  final String back_shiny_female;
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  BlackWhite({
    required this.animated,
    required this.back_default,
    required this.back_female,
    required this.back_shiny,
    required this.back_shiny_female,
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  BlackWhite copyWith({
    Animated? animated,
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return BlackWhite(
      animated: animated ?? this.animated,
      back_default: back_default ?? this.back_default,
      back_female: back_female ?? this.back_female,
      back_shiny: back_shiny ?? this.back_shiny,
      back_shiny_female: back_shiny_female ?? this.back_shiny_female,
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'animated': animated.toMap(),
      'back_default': back_default,
      'back_female': back_female,
      'back_shiny': back_shiny,
      'back_shiny_female': back_shiny_female,
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory BlackWhite.fromMap(Map<String, dynamic> map) {
    return BlackWhite(
      animated: Animated.fromMap(map['animated']),
      back_default: map['back_default'] ?? '',
      back_female: map['back_female'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      back_shiny_female: map['back_shiny_female'] ?? '',
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BlackWhite.fromJson(String source) =>
      BlackWhite.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Black-white(animated: $animated, back_default: $back_default, back_female: $back_female, back_shiny: $back_shiny, back_shiny_female: $back_shiny_female, front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlackWhite &&
        other.animated == animated &&
        other.back_default == back_default &&
        other.back_female == back_female &&
        other.back_shiny == back_shiny &&
        other.back_shiny_female == back_shiny_female &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return animated.hashCode ^
        back_default.hashCode ^
        back_female.hashCode ^
        back_shiny.hashCode ^
        back_shiny_female.hashCode ^
        front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class Animated {
  final String back_default;
  final String back_female;
  final String back_shiny;
  final String back_shiny_female;
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  Animated({
    required this.back_default,
    required this.back_female,
    required this.back_shiny,
    required this.back_shiny_female,
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  Animated copyWith({
    String? back_default,
    String? back_female,
    String? back_shiny,
    String? back_shiny_female,
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return Animated(
      back_default: back_default ?? this.back_default,
      back_female: back_female ?? this.back_female,
      back_shiny: back_shiny ?? this.back_shiny,
      back_shiny_female: back_shiny_female ?? this.back_shiny_female,
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'back_default': back_default,
      'back_female': back_female,
      'back_shiny': back_shiny,
      'back_shiny_female': back_shiny_female,
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory Animated.fromMap(Map<String, dynamic> map) {
    return Animated(
      back_default: map['back_default'] ?? '',
      back_female: map['back_female'] ?? '',
      back_shiny: map['back_shiny'] ?? '',
      back_shiny_female: map['back_shiny_female'] ?? '',
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Animated.fromJson(String source) =>
      Animated.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Animated(back_default: $back_default, back_female: $back_female, back_shiny: $back_shiny, back_shiny_female: $back_shiny_female, front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Animated &&
        other.back_default == back_default &&
        other.back_female == back_female &&
        other.back_shiny == back_shiny &&
        other.back_shiny_female == back_shiny_female &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return back_default.hashCode ^
        back_female.hashCode ^
        back_shiny.hashCode ^
        back_shiny_female.hashCode ^
        front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class GenerationVi {
  final OmegarubyAlphasapphire omegarubyAlphasapphire;
  final Xy xY;
  GenerationVi({
    required this.omegarubyAlphasapphire,
    required this.xY,
  });

  GenerationVi copyWith({
    OmegarubyAlphasapphire? omegarubyAlphasapphire,
    Xy? xY,
  }) {
    return GenerationVi(
      omegarubyAlphasapphire:
          omegarubyAlphasapphire ?? this.omegarubyAlphasapphire,
      xY: xY ?? this.xY,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'omegaruby-alphasapphire': omegarubyAlphasapphire.toMap(),
      'x-y': xY.toMap(),
    };
  }

  factory GenerationVi.fromMap(Map<String, dynamic> map) {
    return GenerationVi(
      omegarubyAlphasapphire:
          OmegarubyAlphasapphire.fromMap(map['omegaruby-alphasapphire']),
      xY: Xy.fromMap(map['x-y']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationVi.fromJson(String source) =>
      GenerationVi.fromMap(json.decode(source));

  @override
  String toString() =>
      'Generation-vi(omegarubyAlphasapphire: $omegarubyAlphasapphire, xY: $xY)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationVi &&
        other.omegarubyAlphasapphire == omegarubyAlphasapphire &&
        other.xY == xY;
  }

  @override
  int get hashCode => omegarubyAlphasapphire.hashCode ^ xY.hashCode;
}

class OmegarubyAlphasapphire {
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  OmegarubyAlphasapphire({
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  OmegarubyAlphasapphire copyWith({
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return OmegarubyAlphasapphire(
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory OmegarubyAlphasapphire.fromMap(Map<String, dynamic> map) {
    return OmegarubyAlphasapphire(
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OmegarubyAlphasapphire.fromJson(String source) =>
      OmegarubyAlphasapphire.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Omegaruby-alphasapphire(front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OmegarubyAlphasapphire &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class Xy {
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  Xy({
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  Xy copyWith({
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return Xy(
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory Xy.fromMap(Map<String, dynamic> map) {
    return Xy(
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Xy.fromJson(String source) => Xy.fromMap(json.decode(source));

  @override
  String toString() {
    return 'X-y(front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Xy &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class GenerationVii {
  final PokemonIcons icons;
  final UltraSunUltraMoon ultraSunUltraMoon;
  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  GenerationVii copyWith({
    PokemonIcons? icons,
    UltraSunUltraMoon? ultraSunUltraMoon,
  }) {
    return GenerationVii(
      icons: icons ?? this.icons,
      ultraSunUltraMoon: ultraSunUltraMoon ?? this.ultraSunUltraMoon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icons': icons.toMap(),
      'ultra-sun-ultra-moon': ultraSunUltraMoon.toMap(),
    };
  }

  factory GenerationVii.fromMap(Map<String, dynamic> map) {
    return GenerationVii(
      icons: PokemonIcons.fromMap(map['icons']),
      ultraSunUltraMoon: UltraSunUltraMoon.fromMap(map['ultra-sun-ultra-moon']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationVii.fromJson(String source) =>
      GenerationVii.fromMap(json.decode(source));

  @override
  String toString() =>
      'Generation-vii(icons: $icons, ultraSunUltraMoon: $ultraSunUltraMoon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationVii &&
        other.icons == icons &&
        other.ultraSunUltraMoon == ultraSunUltraMoon;
  }

  @override
  int get hashCode => icons.hashCode ^ ultraSunUltraMoon.hashCode;
}

class PokemonIcons {
  final String front_default;
  final String front_female;
  PokemonIcons({
    required this.front_default,
    required this.front_female,
  });

  PokemonIcons copyWith({
    String? front_default,
    String? front_female,
  }) {
    return PokemonIcons(
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': front_default,
      'front_female': front_female,
    };
  }

  factory PokemonIcons.fromMap(Map<String, dynamic> map) {
    return PokemonIcons(
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonIcons.fromJson(String source) =>
      PokemonIcons.fromMap(json.decode(source));

  @override
  String toString() =>
      'Icons(front_default: $front_default, front_female: $front_female)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonIcons &&
        other.front_default == front_default &&
        other.front_female == front_female;
  }

  @override
  int get hashCode => front_default.hashCode ^ front_female.hashCode;
}

class UltraSunUltraMoon {
  final String front_default;
  final String front_female;
  final String front_shiny;
  final String front_shiny_female;
  UltraSunUltraMoon({
    required this.front_default,
    required this.front_female,
    required this.front_shiny,
    required this.front_shiny_female,
  });

  UltraSunUltraMoon copyWith({
    String? front_default,
    String? front_female,
    String? front_shiny,
    String? front_shiny_female,
  }) {
    return UltraSunUltraMoon(
      front_default: front_default ?? this.front_default,
      front_female: front_female ?? this.front_female,
      front_shiny: front_shiny ?? this.front_shiny,
      front_shiny_female: front_shiny_female ?? this.front_shiny_female,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'front_default': front_default,
      'front_female': front_female,
      'front_shiny': front_shiny,
      'front_shiny_female': front_shiny_female,
    };
  }

  factory UltraSunUltraMoon.fromMap(Map<String, dynamic> map) {
    return UltraSunUltraMoon(
      front_default: map['front_default'] ?? '',
      front_female: map['front_female'] ?? '',
      front_shiny: map['front_shiny'] ?? '',
      front_shiny_female: map['front_shiny_female'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UltraSunUltraMoon.fromJson(String source) =>
      UltraSunUltraMoon.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ultra-sun-ultra-moon(front_default: $front_default, front_female: $front_female, front_shiny: $front_shiny, front_shiny_female: $front_shiny_female)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UltraSunUltraMoon &&
        other.front_default == front_default &&
        other.front_female == front_female &&
        other.front_shiny == front_shiny &&
        other.front_shiny_female == front_shiny_female;
  }

  @override
  int get hashCode {
    return front_default.hashCode ^
        front_female.hashCode ^
        front_shiny.hashCode ^
        front_shiny_female.hashCode;
  }
}

class GenerationViii {
  final PokemonIcons icons;
  GenerationViii({
    required this.icons,
  });

  GenerationViii copyWith({
    PokemonIcons? icons,
  }) {
    return GenerationViii(
      icons: icons ?? this.icons,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'icons': icons.toMap(),
    };
  }

  factory GenerationViii.fromMap(Map<String, dynamic> map) {
    return GenerationViii(
      icons: PokemonIcons.fromMap(map['icons']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GenerationViii.fromJson(String source) =>
      GenerationViii.fromMap(json.decode(source));

  @override
  String toString() => 'Generation-viii(icons: $icons)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GenerationViii && other.icons == icons;
  }

  @override
  int get hashCode => icons.hashCode;
}

class Stat {
  final int baseStat;
  final int effort;
  final StatListItem stat;
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Stat copyWith({
    int? baseStat,
    int? effort,
    StatListItem? stat,
  }) {
    return Stat(
      baseStat: baseStat ?? this.baseStat,
      effort: effort ?? this.effort,
      stat: stat ?? this.stat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'base_stat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      baseStat: map['base_stat']?.toInt() ?? 0,
      effort: map['effort']?.toInt() ?? 0,
      stat: StatListItem.fromMap(map['stat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stat.fromJson(String source) => Stat.fromMap(json.decode(source));

  @override
  String toString() =>
      'Stat(base_stat: $baseStat, effort: $effort, stat: $stat)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stat &&
        other.baseStat == baseStat &&
        other.effort == effort &&
        other.stat == stat;
  }

  @override
  int get hashCode => baseStat.hashCode ^ effort.hashCode ^ stat.hashCode;
}

class StatListItem {
  final String name;
  final String url;
  StatListItem({
    required this.name,
    required this.url,
  });

  StatListItem copyWith({
    String? name,
    String? url,
  }) {
    return StatListItem(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory StatListItem.fromMap(Map<String, dynamic> map) {
    return StatListItem(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StatListItem.fromJson(String source) =>
      StatListItem.fromMap(json.decode(source));

  @override
  String toString() => 'Stat(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatListItem && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}

class Type {
  final int slot;
  final TypeListItem type;
  Type({
    required this.slot,
    required this.type,
  });

  Type copyWith({
    int? slot,
    TypeListItem? type,
  }) {
    return Type(
      slot: slot ?? this.slot,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'slot': slot,
      'type': type.toMap(),
    };
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      slot: map['slot']?.toInt() ?? 0,
      type: TypeListItem.fromMap(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Type.fromJson(String source) => Type.fromMap(json.decode(source));

  @override
  String toString() => 'Type(slot: $slot, type: $type)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Type && other.slot == slot && other.type == type;
  }

  @override
  int get hashCode => slot.hashCode ^ type.hashCode;
}

class TypeListItem {
  final String name;
  final String url;
  TypeListItem({
    required this.name,
    required this.url,
  });

  TypeListItem copyWith({
    String? name,
    String? url,
  }) {
    return TypeListItem(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory TypeListItem.fromMap(Map<String, dynamic> map) {
    return TypeListItem(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeListItem.fromJson(String source) =>
      TypeListItem.fromMap(json.decode(source));

  @override
  String toString() => 'Type(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TypeListItem && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;

  Color get color => getColorByType(this);

  String get capitalizedName => name[0].toUpperCase() + name.substring(1);
}
