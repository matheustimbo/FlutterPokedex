import 'package:equatable/equatable.dart';
import 'package:pokedex/app/modules/home/data/models/pokemon_list_response_model.dart';

class PokemonListResponse extends Equatable {
  final int count;
  final String next;
  final String previous;
  final List<PokemonListResult> results;

  const PokemonListResponse(this.count, this.next, this.previous, this.results);

  @override
  List<Object?> get props => [count, next, previous, results];
}
