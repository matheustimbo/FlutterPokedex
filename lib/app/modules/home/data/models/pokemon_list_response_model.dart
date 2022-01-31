import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:pokedex/app/modules/home/domain/entities/pokemon_list_response.dart';

class PokemonListResponseModel extends PokemonListResponse {
  const PokemonListResponseModel({
    required count,
    required next,
    required previous,
    required results,
  }) : super(
          count,
          next,
          previous,
          results,
        );

  PokemonListResponseModel copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonListResult>? results,
  }) {
    return PokemonListResponseModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonListResponseModel.fromMap(Map<String, dynamic> map) {
    return PokemonListResponseModel(
      count: map['count']?.toInt() ?? 0,
      next: map['next'] ?? '',
      previous: map['previous'] ?? '',
      results: List<PokemonListResult>.from(
          map['results']?.map((x) => PokemonListResult.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListResponseModel.fromJson(String source) =>
      PokemonListResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonListResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonListResponseModel &&
        other.count == count &&
        other.next == next &&
        other.previous == previous &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode {
    return count.hashCode ^
        next.hashCode ^
        previous.hashCode ^
        results.hashCode;
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}

class PokemonListResult {
  final String name;
  final String url;
  PokemonListResult({
    required this.name,
    required this.url,
  });

  PokemonListResult copyWith({
    String? name,
    String? url,
  }) {
    return PokemonListResult(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory PokemonListResult.fromMap(Map<String, dynamic> map) {
    return PokemonListResult(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListResult.fromJson(String source) =>
      PokemonListResult.fromMap(json.decode(source));

  @override
  String toString() => 'Result(name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonListResult && other.name == name && other.url == url;
  }

  @override
  int get hashCode => name.hashCode ^ url.hashCode;
}
