import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_list_controller.dart';
import 'package:pokedex/app/modules/home/presentation/stores/home_pokemon_list_store.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/pokemon_list_card.dart';

class HomeListScreen extends StatefulWidget {
  HomeListScreen({Key? key}) : super(key: key);

  final _scrollController = ScrollController();

  @override
  _HomeListScreenState createState() => _HomeListScreenState();
}

class _HomeListScreenState
    extends ModularState<HomeListScreen, HomeListController> {
  @override
  void initState() {
    super.initState();
    controller.getInitialList();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (widget._scrollController.position.extentAfter == 0) {
        controller.loadMorePokemons();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    const double itemHeight = 120;
    final double itemWidth = (MediaQuery.of(context).size.width - 48 - 16) / 2;

    final store = Modular.get<HomePokemonListStore>();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: -15,
            top: -15,
            child: Image.asset(
              'assets/images/pokeball.png',
              color: const Color(0xFFF6F6F6),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
            ),
          ),
          Observer(
            builder: (context) {
              return NotificationListener<ScrollEndNotification>(
                onNotification: _handleScrollNotification,
                child: CustomScrollView(
                  controller: widget._scrollController,
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 32,
                        bottom: 24,
                        left: 24,
                      ),
                      sliver: const SliverToBoxAdapter(
                        child: Text(
                          'Pokedex',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 16,
                          childAspectRatio: (itemWidth / itemHeight),
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return PokemonListCard(
                              pokemonListResult: store.pokemonList![index],
                            );
                          },
                          childCount: store.pokemonList?.length ?? 0,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: store.loadingMorePokemons
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 24,
                                  bottom: 24 +
                                      MediaQuery.of(context).padding.bottom,
                                ),
                                child: const CircularProgressIndicator(),
                              ),
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
