import 'package:dio/dio.dart';
import 'package:pokedex/app/modules/home/data/models/pokemon_details_model.dart';
import 'package:pokedex/app/modules/home/data/models/pokemon_list_response_model.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_details.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_list_response.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListResponse> getPokemonList([int? limit, int? offset]);
  Future<PokemonDetails> getPokemonDetails(String id);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<PokemonListResponse> getPokemonList([int? limit, int? offset]) async {
    var url = 'pokemon';
    if (offset != null || limit != null) {
      url += '?';
      if (offset != null) {
        url += 'offset=$offset';
      }
      if (limit != null) {
        if (offset != null) {
          url += '&';
        }
        url += 'limit=$limit';
      }
    }

    final response = await dio.get(url);
    return PokemonListResponseModel.fromMap(response.data);
  }

  @override
  Future<PokemonDetails> getPokemonDetails(String id) async {
    final response = await dio.get('pokemon/$id');
    return PokemonDetailsModel.fromMap(response.data);
  }
}
