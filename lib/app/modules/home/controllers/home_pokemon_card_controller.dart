import 'package:pokedex/app/modules/home/models/pokemon_list_response.dart';
import 'package:pokedex/app/modules/home/repositories/home_pokemon_card_repository.dart';
import 'package:pokedex/app/modules/home/stores/home_pokemon_card_store.dart';

class HomePokemonCardController {
  final HomePokemonCardStore homePokemonCardStore;
  final HomePokemonCardRepository homePokemonCardRepository;

  HomePokemonCardController(
    this.homePokemonCardStore,
    this.homePokemonCardRepository,
  );

  Future<void> fetchPokemonDetails(PokemonListResult pokemonListResult) async {
    homePokemonCardStore.loadingPokemonDetails = true;
    final pokemonId = pokemonListResult.url
        .split('/')[pokemonListResult.url.split('/').length - 2];
    final response =
        await homePokemonCardRepository.getPokemonDetails(pokemonId);
    homePokemonCardStore.pokemonDetails = response;
    homePokemonCardStore.loadingPokemonDetails = false;
  }

  HomePokemonCardStore get store => homePokemonCardStore;
}
