import '../../../lista_pokemons.imports.dart';

abstract class IFavoritesListRepository {
  Future<List<Pokemon>> getFavorites();
}
