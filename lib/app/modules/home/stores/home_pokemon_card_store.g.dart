// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_pokemon_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePokemonCardStore on _HomePokemonCardStoreBase, Store {
  final _$loadingPokemonDetailsAtom =
      Atom(name: '_HomePokemonCardStoreBase.loadingPokemonDetails');

  @override
  bool get loadingPokemonDetails {
    _$loadingPokemonDetailsAtom.reportRead();
    return super.loadingPokemonDetails;
  }

  @override
  set loadingPokemonDetails(bool value) {
    _$loadingPokemonDetailsAtom.reportWrite(value, super.loadingPokemonDetails,
        () {
      super.loadingPokemonDetails = value;
    });
  }

  final _$pokemonDetailsAtom =
      Atom(name: '_HomePokemonCardStoreBase.pokemonDetails');

  @override
  PokemonDetails? get pokemonDetails {
    _$pokemonDetailsAtom.reportRead();
    return super.pokemonDetails;
  }

  @override
  set pokemonDetails(PokemonDetails? value) {
    _$pokemonDetailsAtom.reportWrite(value, super.pokemonDetails, () {
      super.pokemonDetails = value;
    });
  }

  @override
  String toString() {
    return '''
loadingPokemonDetails: ${loadingPokemonDetails},
pokemonDetails: ${pokemonDetails}
    ''';
  }
}
