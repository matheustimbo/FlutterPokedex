import 'package:mobx/mobx.dart';
import 'package:pokedex/app/modules/home/models/pokemon_details.dart';
import 'package:pokedex/app/modules/home/models/pokemon_list_response.dart';
import 'package:pokedex/app/modules/home/repositories/home_pokemon_card_repository.dart';

part 'home_pokemon_card_controller.g.dart';

class HomePokemonCardController = _HomePokemonCardControllerBase
    with _$HomePokemonCardController;

abstract class _HomePokemonCardControllerBase with Store {
  final HomePokemonCardRepository homePokemonCardRepository;

  _HomePokemonCardControllerBase(this.homePokemonCardRepository);

  @observable
  bool loadingPokemonDetails = false;

  @observable
  PokemonDetails? pokemonDetails;

  Future<void> fetchPokemonDetails(PokemonListResult pokemonListResult) async {
    loadingPokemonDetails = true;
    final pokemonId = pokemonListResult.url
        .split('/')[pokemonListResult.url.split('/').length - 2];
    final response =
        await homePokemonCardRepository.getPokemonDetails(pokemonId);
    pokemonDetails = response;
    loadingPokemonDetails = false;
  }
}
