import 'package:poke_app/app/modulos/lista_pokemons/domain/entities/pokemon.entity.dart';

import '../favoritos.imports.dart';

class FavoritesListRepository implements IFavoritesListRepository {
  IFavoritesListDatasource datasource;

  FavoritesListRepository({
    required this.datasource,
  });

  @override
  Future<List<Pokemon>> getFavorites() async {
    var teste = await datasource.getFavorites();

    var p = "";

    return [Pokemon(nome: "Teste")];
  }

  @override
  Future addFavorite(Pokemon newFavorite) async {
    await datasource.addFavorite(Pokemon(nome: "Testando favoritos"));
  }
}
