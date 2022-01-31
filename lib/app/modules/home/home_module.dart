import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/app/modules/home/data/repositories/home_list_repository_impl.dart';
import 'package:pokedex/app/modules/home/domain/usecases/get_pokemon_details_usecase.dart';
import 'package:pokedex/app/modules/home/domain/usecases/list_pokemons_usecase.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_list_controller.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_pokemon_card_controller.dart';
import 'package:pokedex/app/modules/home/presentation/pages/home_list_screen.dart';
import 'package:pokedex/app/modules/home/presentation/pages/pokemon_details_screen.dart';
import 'package:pokedex/app/modules/home/presentation/stores/home_pokemon_card_store.dart';
import 'package:pokedex/app/modules/home/presentation/stores/home_pokemon_list_store.dart';

class HomeModule extends Module {
  static const String routeName = '/home_module';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PokemonRemoteDataSourceImpl(i())),
    Bind.lazySingleton((i) => PokemonRepositoryImpl(i())),
    Bind.lazySingleton((i) => ListPokemonsUsecase(i())),
    Bind.lazySingleton((i) => HomePokemonListStore()),
    Bind.lazySingleton((i) => HomeListController(i(), i())),
    Bind.lazySingleton((i) => HomePokemonListStore()),
    Bind.lazySingleton((i) => GetPokemonDetailsUsecase(i())),
    Bind.factory((i) => HomePokemonCardController(i(), i())),
    Bind.factory((i) => HomePokemonCardStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomeListScreen(),
    ),
    ChildRoute(
      PokemonDetailsScreen.routeName,
      child: (_, args) => PokemonDetailsScreen(
        pokemon: args.data,
      ),
    ),
  ];
}
