import 'package:pokedex/app/modules/home/repositories/home_list_repository.dart';
import 'package:pokedex/app/modules/home/stores/home_pokemon_list_store.dart';

class HomeListController {
  final HomeListRepository repository;
  final HomePokemonListStore store;

  HomeListController(
    this.repository,
    this.store,
  );

  final listRequestLimit = 20;

  int offset = 0;

  Future<void> getInitialList() async {
    store.loadingInitialList = true;
    final response = await repository.getPokemonList(listRequestLimit, offset);
    store.pokemonList = response.results;
    store.loadingInitialList = false;
    offset += response.results.length;
  }

  Future<void> loadMorePokemons() async {
    if (!store.loadingMorePokemons && store.pokemonList != null) {
      store.loadingMorePokemons = true;
      final response =
          await repository.getPokemonList(listRequestLimit, offset);
      store.pokemonList!.addAll(response.results);
      store.loadingMorePokemons = false;
      offset += response.results.length;
    }
  }
}
