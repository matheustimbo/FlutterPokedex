import 'package:dio/dio.dart';
import 'package:pokedex/app/modules/home/models/pokemon_details.dart';

class HomePokemonCardRepository {
  final Dio dio;

  HomePokemonCardRepository(this.dio);

  Future<PokemonDetails> getPokemonDetails(String id) async {
    final response = await dio.get('pokemon/$id');
    return PokemonDetails.fromMap(response.data);
  }
}
