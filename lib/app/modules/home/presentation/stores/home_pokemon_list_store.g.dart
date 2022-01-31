// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_pokemon_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePokemonListStore on _HomePokemonListStoreBase, Store {
  final _$pokemonListAtom = Atom(name: '_HomePokemonListStoreBase.pokemonList');

  @override
  List<PokemonListResult>? get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<PokemonListResult>? value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  final _$loadingInitialListAtom =
      Atom(name: '_HomePokemonListStoreBase.loadingInitialList');

  @override
  bool get loadingInitialList {
    _$loadingInitialListAtom.reportRead();
    return super.loadingInitialList;
  }

  @override
  set loadingInitialList(bool value) {
    _$loadingInitialListAtom.reportWrite(value, super.loadingInitialList, () {
      super.loadingInitialList = value;
    });
  }

  final _$loadingMorePokemonsAtom =
      Atom(name: '_HomePokemonListStoreBase.loadingMorePokemons');

  @override
  bool get loadingMorePokemons {
    _$loadingMorePokemonsAtom.reportRead();
    return super.loadingMorePokemons;
  }

  @override
  set loadingMorePokemons(bool value) {
    _$loadingMorePokemonsAtom.reportWrite(value, super.loadingMorePokemons, () {
      super.loadingMorePokemons = value;
    });
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
loadingInitialList: ${loadingInitialList},
loadingMorePokemons: ${loadingMorePokemons}
    ''';
  }
}
