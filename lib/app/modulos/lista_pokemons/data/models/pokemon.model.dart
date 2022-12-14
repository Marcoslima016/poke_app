import 'dart:convert';

import 'package:get/get.dart';
import 'package:poke_app/app/modulos/detalhes_pokemon/domain/entities/pokemon_details.entity.dart';

import '../../../modulos.imports.dart';
import '../../lista_pokemons.imports.dart';

class PokemonModel extends Pokemon {
  //

  RxBool isFavoriteRx = false.obs;

  PokemonModel({required String id, required String nome, required PokemonDetails? details, required bool isFavorite})
      : super(
          id: id,
          nome: nome,
          details: details,
          isFavorite: isFavorite,
        ) {
    if (super.isFavorite) {
      isFavoriteRx.value = true;
    } else {
      isFavoriteRx.value = false;
    }
  }

  //TO JSON
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() {
    PokemonDetailsModel pokemonDetailsModel = PokemonDetailsModel.fromEntity(details!);
    return {
      'nome': nome,
      'id': id,
      'details': pokemonDetailsModel.toJson(),
      'isFavorite': isFavorite,
    };
  }

  //FROM JSON
  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      nome: json['nome'],
      id: json['id'],
      details: PokemonDetailsModel.toEntity(PokemonDetailsModel.fromJson(json)),
      isFavorite: json['isFavorite'],
    );
  }

  //FROM ENTITY
  factory PokemonModel.fromEntity(Pokemon entity) {
    return PokemonModel(
      nome: entity.nome,
      id: entity.id,
      details: entity.details,
      isFavorite: entity.isFavorite,
    );
  }
}
