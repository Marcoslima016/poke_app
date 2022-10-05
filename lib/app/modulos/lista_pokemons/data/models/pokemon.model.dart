import 'dart:convert';

import '../../lista_pokemons.imports.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required String nome}) : super(nome: nome);

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
    );
  }

  //FROM ENTITY
  factory PokemonModel.fromEntity(Pokemon entity) => PokemonModel(
        nome: entity.nome,
      );
}
