import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/controllers/home_list_controller.dart';
import 'package:pokedex/app/modules/home/controllers/home_pokemon_card_controller.dart';
import 'package:pokedex/app/modules/home/pages/home_list_screen.dart';
import 'package:pokedex/app/modules/home/pages/pokemon_details_screen.dart';
import 'package:pokedex/app/modules/home/repositories/home_list_repository.dart';
import 'package:pokedex/app/modules/home/repositories/home_pokemon_card_repository.dart';

class HomeModule extends Module {
  static const String routeName = '/home_module';

  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
      (i) => HomeListRepository(i()),
    ),
    Bind.lazySingleton(
      (i) => HomeListController(i()),
    ),
    Bind.lazySingleton(
      (i) => HomePokemonCardRepository(i()),
    ),
    Bind.factory(
      (i) => HomePokemonCardController(i()),
    )
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
