import 'package:pokedex/app/modules/home/data/models/pokemon_list_response_model.dart';
import 'package:pokedex/app/modules/home/domain/usecases/get_pokemon_details_usecase.dart';
import 'package:pokedex/app/modules/home/presentation/stores/home_pokemon_card_store.dart';

class HomePokemonCardController {
  final HomePokemonCardStore homePokemonCardStore;
  final GetPokemonDetailsUsecase getPokemonDetailsUsecase;

  HomePokemonCardController(
      this.homePokemonCardStore, this.getPokemonDetailsUsecase);

  Future<void> fetchPokemonDetails(PokemonListResult pokemonListResult) async {
    homePokemonCardStore.loadingPokemonDetails = true;
    final pokemonId = pokemonListResult.url
        .split('/')[pokemonListResult.url.split('/').length - 2];
    final result = await getPokemonDetailsUsecase
        .call(GetPokemonDetailsUsecaseParams(pokemonId));
    result.fold(
      (error) => {},
      (pokemonDetails) {
        homePokemonCardStore.pokemonDetails = pokemonDetails;
      },
    );
    homePokemonCardStore.loadingPokemonDetails = false;
  }

  HomePokemonCardStore get store => homePokemonCardStore;
}
