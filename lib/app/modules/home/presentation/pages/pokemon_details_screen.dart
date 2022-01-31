import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_details.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/pokemon_evolutions_tab.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/pokemon_moves_tab.dart';
import 'package:pokedex/app/modules/home/presentation/widgets/pokemon_types_tab.dart';
import 'package:pokedex/core/config/app_colors.dart';
import 'package:pokedex/core/widgets/pokemon_type_tag.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonDetailsScreen extends StatefulWidget {
  static const routeName = '/pokemon_details';

  final PokemonDetails pokemon;

  const PokemonDetailsScreen({Key? key, required this.pokemon})
      : super(key: key);

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _cardController;
  late AnimationController _cardHeightController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _cardHeightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _rotateController.repeat();

    super.initState();
  }

  @override
  void dispose() {
    _cardController.dispose();
    _cardHeightController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final infoPanelMinHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            120 +
            MediaQuery.of(context).size.width * 0.6);
    final infoPanelMaxHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top + 48);
    return Scaffold(
      backgroundColor: widget.pokemon.color,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          RotatingPokeball(
            rotateController: _rotateController,
          ),
          PokemonInfoPanel(
            cardController: _cardController,
            infoPanelMinHeight: infoPanelMinHeight,
            infoPanelMaxHeight: infoPanelMaxHeight,
            pokemon: widget.pokemon,
          ),
          PokemonImage(
            pokemon: widget.pokemon,
            cardController: _cardController,
            infoPanelMinHeight: infoPanelMinHeight,
            infoPanelMaxHeight: infoPanelMaxHeight,
          ),
          PokemonDetailsHeader(
            pokemon: widget.pokemon,
          ),
        ],
      ),
    );
  }
}

class RotatingPokeball extends StatelessWidget {
  final AnimationController rotateController;
  const RotatingPokeball({Key? key, required this.rotateController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -(MediaQuery.of(context).size.width * 0.08),
      top: MediaQuery.of(context).size.width * 0.55,
      child: RotationTransition(
        turns: rotateController,
        child: Image.asset(
          'assets/images/pokeball.png',
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 2,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
    );
  }
}

class PokemonInfoPanel extends StatelessWidget {
  final AnimationController cardController;
  final double infoPanelMinHeight;
  final double infoPanelMaxHeight;
  final PokemonDetails pokemon;

  const PokemonInfoPanel({
    Key? key,
    required this.cardController,
    required this.infoPanelMinHeight,
    required this.infoPanelMaxHeight,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: infoPanelMinHeight,
      maxHeight: infoPanelMaxHeight,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(
          25,
        ),
        topRight: Radius.circular(
          25,
        ),
      ),
      panel: Padding(
        padding: const EdgeInsets.only(
          top: 32,
        ),
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TabBar(
                  labelColor: AppColors.black,
                  unselectedLabelColor: AppColors.grey,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 16,
                  ),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  indicatorColor: AppColors.indigo,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      text: 'Types',
                      height: 20,
                    ),
                    Tab(
                      text: 'Evolutions',
                      height: 20,
                    ),
                    Tab(
                      text: 'Moves',
                      height: 20,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(children: [
                    const PokemonTypesTab(),
                    PokemonEvolutionsTab(
                      pokemon: pokemon,
                    ),
                    const PokemonMovesTab(),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
      onPanelSlide: (position) => cardController.value = position,
    );
  }
}

class PokemonDetailsHeader extends StatelessWidget {
  const PokemonDetailsHeader({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final PokemonDetails pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Modular.to.pop(),
                icon: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.capitalizedName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    children: pokemon.types
                        .map((pokemonType) => Padding(
                              padding: const EdgeInsets.only(
                                right: 8,
                              ),
                              child: PokemonTypeTag(
                                type: pokemonType.type.capitalizedName,
                              ),
                            ))
                        .toList(),
                  )
                ],
              ),
              Text(
                pokemon.number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}

class PokemonImage extends StatelessWidget {
  final PokemonDetails pokemon;
  final AnimationController cardController;
  final double infoPanelMinHeight;
  final double infoPanelMaxHeight;

  const PokemonImage({
    Key? key,
    required this.pokemon,
    required this.cardController,
    required this.infoPanelMinHeight,
    required this.infoPanelMaxHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translationAmount = infoPanelMaxHeight - infoPanelMinHeight;
    return Positioned(
      top: MediaQuery.of(context).padding.top + 120,
      child: AnimatedBuilder(
        animation: cardController,
        builder: (context, _) {
          return Transform.translate(
            offset: Offset(
              0,
              -(translationAmount * cardController.value),
            ),
            child: Opacity(
              opacity: 1 - cardController.value,
              child: Hero(
                tag: 'pokemon_sprite_frontdefault_${pokemon.id}',
                child: CachedNetworkImage(
                  imageUrl: pokemon.imageUrl,
                  placeholder: (context, url) => const SizedBox(),
                  errorWidget: (context, url, error) => const SizedBox(),
                  imageBuilder: (context, imageProvider) => Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
