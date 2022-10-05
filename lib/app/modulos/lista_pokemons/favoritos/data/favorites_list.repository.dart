import 'dart:convert';

import 'package:poke_app/app/modulos/lista_pokemons/domain/entities/pokemon.entity.dart';

import '../../lista_pokemons.imports.dart';
import '../favoritos.imports.dart';

class FavoritesListRepository implements IFavoritesListRepository {
  IFavoritesListDatasource datasource;

  FavoritesListRepository({
    required this.datasource,
  });

  //----------------------------------------- GET FAVORITES -----------------------------------------

  @override
  Future<List<Pokemon>> getFavorites() async {
    List dbResult = await datasource.getFavorites();

    if (dbResult == []) return [];

    List<Pokemon> favoritesList = [];
    for (String resultJson in dbResult) {
      favoritesList.add(PokemonModel.fromMap(json.decode(resultJson)));
    }

    return favoritesList;
  }

  //------------------------------------------ ADD FAVORITE ------------------------------------------

  @override
  Future addFavorite(Pokemon newFavorite) async {
    await datasource.addFavorite(newFavorite);
  }
}
