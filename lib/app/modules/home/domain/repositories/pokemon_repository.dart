import 'package:dartz/dartz.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_details.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_list_response.dart';
import 'package:pokedex/core/errors/failures.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonListResponse>> getPokemonList([
    int? limit,
    int? offset,
  ]);

  Future<Either<Failure, PokemonDetails>> getPokemonDetails(
    String id,
  );
}
