// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeListController on _HomeListControllerBase, Store {
  final _$pokemonListAtom = Atom(name: '_HomeListControllerBase.pokemonList');

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
      Atom(name: '_HomeListControllerBase.loadingInitialList');

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

  final _$offsetAtom = Atom(name: '_HomeListControllerBase.offset');

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  final _$loadingMorePokemonsAtom =
      Atom(name: '_HomeListControllerBase.loadingMorePokemons');

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

  final _$getInitialListAsyncAction =
      AsyncAction('_HomeListControllerBase.getInitialList');

  @override
  Future<void> getInitialList() {
    return _$getInitialListAsyncAction.run(() => super.getInitialList());
  }

  final _$loadMorePokemonsAsyncAction =
      AsyncAction('_HomeListControllerBase.loadMorePokemons');

  @override
  Future<void> loadMorePokemons() {
    return _$loadMorePokemonsAsyncAction.run(() => super.loadMorePokemons());
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
loadingInitialList: ${loadingInitialList},
offset: ${offset},
loadingMorePokemons: ${loadingMorePokemons}
    ''';
  }
}
