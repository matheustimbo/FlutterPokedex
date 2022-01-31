import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_list_response.dart';
import 'package:pokedex/app/modules/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex/core/errors/failures.dart';
import 'package:pokedex/core/usecases/usecase.dart';

class ListPokemonsUsecase
    implements UseCase<PokemonListResponse, ListPokemonUsecaseParams> {
  final PokemonRepository repository;

  ListPokemonsUsecase(this.repository);

  @override
  Future<Either<Failure, PokemonListResponse>> call(
      ListPokemonUsecaseParams params) {
    return repository.getPokemonList(
      params.limit,
      params.offset,
    );
  }
}

class ListPokemonUsecaseParams extends Equatable {
  final int? limit;
  final int? offset;

  const ListPokemonUsecaseParams(this.limit, this.offset);

  @override
  List<Object?> get props => [limit, offset];
}
