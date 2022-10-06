import '../../../app.imports.dart';
import '../lista_pokemons.imports.dart';

class PokemonsListRESTDatasource implements IPokemonsListDatasource {
  //
  //REST CLIENT
  final RESTClient _client = RESTClient();

  @override
  Future<Map> getPokemons() async {
    final response = await _client.get(endPoint: "pokemon?limit=100000&offset=0");
    // final response = await _client.get(endPoint: "pokemon");
    return response;
  }
  //
}
