import 'package:dartz/dartz.dart';
import 'package:pokedex/app/modules/home/data/datasources/pokemon_remote_data_source.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_details.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_list_response.dart';
import 'package:pokedex/app/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/core/errors/failures.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PokemonListResponse>> getPokemonList(
      [int? limit, int? offset]) async {
    try {
      return Right(await remoteDataSource.getPokemonList(limit, offset));
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PokemonDetails>> getPokemonDetails(String id) async {
    try {
      return Right(await remoteDataSource.getPokemonDetails(id));
    } on Exception catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
