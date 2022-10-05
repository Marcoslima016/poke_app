import '../../../modulos.imports.dart';
import '../../detalhes_pokemon.imports.dart';

class PokemonDetailsRepository implements IPokemonDetailsRepository {
  IPokemonDetailsDatasource datasource;

  PokemonDetailsRepository({
    required this.datasource,
  });

  @override
  Future<PokemonDetails> loadDetails(Pokemon pokemon) async {
    Map apiResponse = await datasource.loadDetails(pokeName: pokemon.nome);

    var p = "";

    return PokemonDetails(description: "");
  }
  //
}
