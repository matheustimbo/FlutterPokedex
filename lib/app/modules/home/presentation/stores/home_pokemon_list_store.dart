import 'package:mobx/mobx.dart';
import 'package:pokedex/app/modules/home/data/models/pokemon_list_response_model.dart';

part 'home_pokemon_list_store.g.dart';

class HomePokemonListStore = _HomePokemonListStoreBase
    with _$HomePokemonListStore;

abstract class _HomePokemonListStoreBase with Store {
  @observable
  List<PokemonListResult>? pokemonList;

  @observable
  bool loadingInitialList = false;

  @observable
  bool loadingMorePokemons = false;
}
