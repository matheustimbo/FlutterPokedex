import 'package:mobx/mobx.dart';
import 'package:pokedex/app/modules/home/models/pokemon_list_response.dart';
import 'package:pokedex/app/modules/home/repositories/home_list_repository.dart';

part 'home_list_controller.g.dart';

class HomeListController = _HomeListControllerBase with _$HomeListController;

abstract class _HomeListControllerBase with Store {
  final HomeListRepository homeListRepository;

  _HomeListControllerBase(this.homeListRepository);

  @observable
  List<PokemonListResult>? pokemonList;

  @observable
  bool loadingInitialList = false;

  @observable
  int offset = 0;

  final listRequestLimit = 20;

  @observable
  bool loadingMorePokemons = false;

  @action
  Future<void> getInitialList() async {
    loadingInitialList = true;
    final response =
        await homeListRepository.getPokemonList(listRequestLimit, offset);
    pokemonList = response.results;
    loadingInitialList = false;
    offset += response.results.length;
  }

  @action
  Future<void> loadMorePokemons() async {
    if (!loadingMorePokemons && pokemonList != null) {
      loadingMorePokemons = true;
      final response =
          await homeListRepository.getPokemonList(listRequestLimit, offset);
      pokemonList!.addAll(response.results);
      loadingMorePokemons = false;
      offset += response.results.length;
    }
  }
}
