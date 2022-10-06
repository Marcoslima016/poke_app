import 'dart:convert';

import '../../../modulos.imports.dart';
import '../../detalhes_pokemon.imports.dart';

class PokemonDetailsRepository implements IPokemonDetailsRepository {
  IPokemonDetailsDatasource datasource;

  PokemonDetailsRepository({
    required this.datasource,
  });

  @override
  Future<PokemonDetails> loadDetails(Pokemon pokemon) async {
    Map<String, dynamic> apiResponse = await datasource.loadDetails(pokeName: pokemon.nome);

    var t = PokemonDetailsModel.fromJson(apiResponse);

    return PokemonDetailsModel.toEntity(PokemonDetailsModel.fromJson(apiResponse));
  }
  //
}
