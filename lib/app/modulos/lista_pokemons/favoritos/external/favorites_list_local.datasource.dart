import 'dart:convert';

import '../../../../app.imports.dart';
import '../../lista_pokemons.imports.dart';
import '../favoritos.imports.dart';

class FavoritesListLocalDatasource implements IFavoritesListDatasource {
  ILocalStorageDriver localStorageDriver;

  final String _dbKey = "listaDeFavoritos";

  FavoritesListLocalDatasource({
    required this.localStorageDriver,
  });

  //----------------------------------------- GET FAVORITES -----------------------------------------

  @override
  Future<List> getFavorites() async {
    List dbResult = await localStorageDriver.getList(key: _dbKey);
    return dbResult;
  }

  //----------------------------------------- ADD FAVORITE -----------------------------------------

  @override
  Future addFavorite(Pokemon newFavorite) async {
    List dbList = await localStorageDriver.getList(key: _dbKey);
    List<PokemonModel> favoritesList = [];

    for (var resultJson in dbList) {
      favoritesList.add(PokemonModel.fromMap(json.decode(resultJson)));
    }

    PokemonModel newFavoriteModel = PokemonModel.fromEntity(newFavorite);

    favoritesList.add(newFavoriteModel);

    var favoritesListMap = [];
    for (PokemonModel favorite in favoritesList) {
      favoritesListMap.add(favorite.toJson());
    }

    await localStorageDriver.putList(key: _dbKey, list: favoritesListMap);
  }

  //----------------------------------------- REMOVE FAVORITE -----------------------------------------

  @override
  Future removeFavorite(Pokemon favorite) async {
    List dbList = await localStorageDriver.getList(key: _dbKey);
    List<PokemonModel> favoritesList = [];

    for (var resultJson in dbList) {
      favoritesList.add(PokemonModel.fromMap(json.decode(resultJson)));
    }

    PokemonModel fevoriteToRemove = PokemonModel.fromEntity(favorite);

    favoritesList.removeWhere((item) => item.nome == fevoriteToRemove.nome);

    var favoritesListMap = [];
    for (PokemonModel favorite in favoritesList) {
      favoritesListMap.add(favorite.toJson());
    }

    await localStorageDriver.putList(key: _dbKey, list: favoritesListMap);
  }
}
