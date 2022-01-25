import 'package:dio/dio.dart';
import 'package:pokedex/app/modules/home/models/pokemon_list_response.dart';

class HomeListRepository {
  final Dio dio;

  HomeListRepository(this.dio);

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
    return PokemonListResponse.fromMap(response.data);
  }
}
