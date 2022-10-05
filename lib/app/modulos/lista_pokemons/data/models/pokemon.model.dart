import 'dart:convert';

import 'package:poke_app/app/modulos/detalhes_pokemon/domain/entities/pokemon_details.entity.dart';

import '../../../modulos.imports.dart';
import '../../lista_pokemons.imports.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required String id, required String nome, required PokemonDetails? details}) : super(id: id, nome: nome, details: details);

  //TO JSON
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
    };
  }

  //FROM JSON
  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      nome: json['nome'],
      id: json['id'],
      details: PokemonDetailsModel.fromMap(json),
    );
  }

  //FROM ENTITY
  factory PokemonModel.fromEntity(Pokemon entity) => PokemonModel(
        nome: entity.nome,
        id: entity.id,
        details: entity.details,
      );
}
