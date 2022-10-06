import '../../../app.imports.dart';
import '../detalhes_pokemon.imports.dart';

class PokemonDetailsRestDatasource implements IPokemonDetailsDatasource {
  //

  //REST CLIENT
  final RESTClient _client = RESTClient();

  @override
  Future<Map<String, dynamic>> loadDetails({required String pokeName}) async {
    final response = await _client.get(endPoint: "pokemon-species/" + pokeName);
    return response;
  }
  //
}
