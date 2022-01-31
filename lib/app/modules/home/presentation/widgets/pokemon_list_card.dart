import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/data/models/pokemon_list_response_model.dart';
import 'package:pokedex/app/modules/home/presentation/controllers/home_pokemon_card_controller.dart';
import 'package:pokedex/app/modules/home/presentation/pages/pokemon_details_screen.dart';
import 'package:pokedex/core/widgets/pokemon_type_tag.dart';
import 'package:shimmer/shimmer.dart';

class PokemonListCard extends StatefulWidget {
  final PokemonListResult pokemonListResult;

  const PokemonListCard({Key? key, required this.pokemonListResult})
      : super(key: key);

  @override
  _PokemonListCardState createState() => _PokemonListCardState();
}

class _PokemonListCardState
    extends ModularState<PokemonListCard, HomePokemonCardController> {
  @override
  void initState() {
    super.initState();
    controller.fetchPokemonDetails(widget.pokemonListResult);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.store.loadingPokemonDetails) {
        return Shimmer.fromColors(
          child: Container(
            width: double.infinity,
            height: 120,
            color: Colors.grey,
          ),
          baseColor: const Color(0xFFEDEDED),
          highlightColor: const Color(0xFFF6F6F6),
        );
      }
      if (controller.store.pokemonDetails != null) {
        final pokemon = controller.store.pokemonDetails!;
        return InkWell(
          onTap: () => Modular.to.pushNamed(
            PokemonDetailsScreen.routeName,
            arguments: pokemon,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                height: 120,
                width: double.infinity,
                color: pokemon.color,
                child: Stack(
                  children: [
                    Positioned(
                      right: -15,
                      bottom: -15,
                      child: Image.asset(
                        'assets/images/pokeball.png',
                        color: Colors.white.withOpacity(0.2),
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Hero(
                        tag: 'pokemon_sprite_frontdefault_${pokemon.id}',
                        child: CachedNetworkImage(
                          imageUrl: pokemon.imageUrl,
                          placeholder: (context, url) => const SizedBox(),
                          errorWidget: (context, url, error) =>
                              const SizedBox(),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 90,
                            height: 90,
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
                    Positioned(
                      right: 12,
                      top: 12,
                      child: Text(
                        pokemon.number,
                        style: const TextStyle(
                          color: Colors.black12,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.capitalizedName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          ...pokemon.types
                              .take(2)
                              .map(
                                (pokemonType) => Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                  ),
                                  child: PokemonTypeTag(
                                    type: pokemonType.type.capitalizedName,
                                  ),
                                ),
                              )
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        );
      }

      return const SizedBox();
    });
  }
}
