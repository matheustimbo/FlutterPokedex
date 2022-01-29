import 'package:mobx/mobx.dart';
import 'package:pokedex/app/modules/home/models/pokemon_details.dart';

part 'home_pokemon_card_store.g.dart';

class HomePokemonCardStore = _HomePokemonCardStoreBase
    with _$HomePokemonCardStore;

abstract class _HomePokemonCardStoreBase with Store {
  @observable
  bool loadingPokemonDetails = false;

  @observable
  PokemonDetails? pokemonDetails;
}
