import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/modules/home/models/pokemon_details.dart';
import 'package:pokedex/core/widgets/pokemon_type_tag.dart';

class PokemonDetailsScreen extends StatefulWidget {
  static const routeName = '/pokemon_details';

  final PokemonDetails pokemon;

  const PokemonDetailsScreen({Key? key, required this.pokemon})
      : super(key: key);

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.color,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
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
                          widget.pokemon.capitalizedName,
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
                          children: widget.pokemon.types
                              .map((pokemonType) => Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8,
                                    ),
                                    child: PokemonTypeTag(
                                        type: pokemonType.type.capitalizedName),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                    Text(
                      widget.pokemon.number,
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
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.3,
            child: Hero(
              tag: 'pokemon_sprite_frontdefault',
              child: CachedNetworkImage(
                imageUrl: widget.pokemon.sprites.frontDefault,
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
        ],
      ),
    );
  }
}
