import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_details.dart';
import 'package:pokedex/app/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/core/usecases/usecase.dart';

class GetPokemonDetailsUsecase
    implements UseCase<PokemonDetails, GetPokemonDetailsUsecaseParams> {
  final PokemonRepository repository;

  GetPokemonDetailsUsecase(this.repository);

  @override
  Future<Either<Failure, PokemonDetails>> call(
      GetPokemonDetailsUsecaseParams params) {
    return repository.getPokemonDetails(params.id);
  }
}

class GetPokemonDetailsUsecaseParams extends Equatable {
  final String id;

  const GetPokemonDetailsUsecaseParams(this.id);

  @override
  List<Object?> get props => [id];
}
