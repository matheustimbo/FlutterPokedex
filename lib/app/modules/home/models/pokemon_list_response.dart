import 'dart:convert';

import 'package:flutter/foundation.dart';

class PokemonListResponse {
  final int count;
  final String next;
  final String previous;
  final List<PokemonListResult> results;
  PokemonListResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  PokemonListResponse copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonListResult>? results,
  }) {
    return PokemonListResponse(
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

  factory PokemonListResponse.fromMap(Map<String, dynamic> map) {
    return PokemonListResponse(
      count: map['count']?.toInt() ?? 0,
      next: map['next'] ?? '',
      previous: map['previous'] ?? '',
      results: List<PokemonListResult>.from(
          map['results']?.map((x) => PokemonListResult.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonListResponse.fromJson(String source) =>
      PokemonListResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PokemonListResponse(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PokemonListResponse &&
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
