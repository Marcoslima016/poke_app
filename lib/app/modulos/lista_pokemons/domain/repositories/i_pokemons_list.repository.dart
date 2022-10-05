import '../domain.imports.dart';

abstract class IPokemonsListRepo {
  Future<List<Pokemon>> getPokemons();
}
