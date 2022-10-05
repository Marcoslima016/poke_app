import '../lista_pokemons.imports.dart';
import 'data.imports.dart';

class PokemonsListRepository implements IPokemonsListRepo {
  IPokemonsListDatasource pokemonsListDatasource;

  int offset = 0; //// ***Talvez nao sera utilizado

  int qtdResults = 0;

  String nextEndpoint = '';

  String previousEndpoint = '';

  PokemonsListRepository({
    required this.pokemonsListDatasource,
  });

  @override
  Future<List<Pokemon>> getPokemons() async {
    final response = await pokemonsListDatasource.getPokemons();

    List<Pokemon> resultList = [];

    for (Map result in response["results"]) {
      resultList.add(
        Pokemon(
          nome: result["name"],
        ),
      );
    }

    return resultList;
  }
}
