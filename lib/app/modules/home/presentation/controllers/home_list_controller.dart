import 'package:pokedex/app/modules/home/domain/usecases/list_pokemons_usecase.dart';
import 'package:pokedex/app/modules/home/presentation/stores/home_pokemon_list_store.dart';

class HomeListController {
  final ListPokemonsUsecase listPokemonsUsecase;
  final HomePokemonListStore store;

  HomeListController(
    this.listPokemonsUsecase,
    this.store,
  );

  final listRequestLimit = 20;

  int offset = 0;

  Future<void> getInitialList() async {
    store.loadingInitialList = true;
    final result = await listPokemonsUsecase
        .call(ListPokemonUsecaseParams(listRequestLimit, offset));
    result.fold((error) => {}, (pokemonList) {
      store.pokemonList = pokemonList.results;
      offset += pokemonList.results.length;
    });
    store.loadingInitialList = false;
  }

  Future<void> loadMorePokemons() async {
    if (!store.loadingMorePokemons && store.pokemonList != null) {
      store.loadingMorePokemons = true;
      final result = await listPokemonsUsecase
          .call(ListPokemonUsecaseParams(listRequestLimit, offset));

      result.fold((error) => {}, (pokemonList) {
        store.pokemonList!.addAll(pokemonList.results);
        offset += pokemonList.results.length;
      });
      store.loadingMorePokemons = false;
    }
  }
}
