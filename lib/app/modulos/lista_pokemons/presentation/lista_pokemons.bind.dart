import 'package:get/get.dart';
import 'package:poke_app/app/modulos/lista_pokemons/favoritos/domain/usecases/add_favorite.usecase.dart';

import '../../../core/core.imports.dart';
import '../lista_pokemons.imports.dart';

class ListaPokemonsBinding extends Bindings {
  @override
  void dependencies() {
    //
    //-- CLIENTS --
    RESTClient restClient = RESTClient();

    //-- DRIVERS --
    ILocalStorageDriver localStorageDriver = HiveDriver(boxName: "favoritos");

    //=============================================== CORE ===============================================

    //----------------------------------- DATA ----------------------------------

    //-- POKEMONS LIST REPOSITORY --
    Get.put<IPokemonsListRepo>(
      PokemonsListRepository(pokemonsListDatasource: PokemonsListRESTDatasource()),
      permanent: true,
    );

    //---------------------------------- DOMAIN ----------------------------------

    //-- USECASE LOAD LIST --
    Get.put<ILoadList>(
      LoadList(repository: Get.find<IPokemonsListRepo>()),
    );

    //-- USECASE POKEMONS LIST MANAGER --
    Get.put<IPokemonsListManager>(
      PokemonsListManager(usecaseLoadList: Get.find<ILoadList>()),
    );

    //============================================= FAVORITOS =============================================

    //----------------------------------- DATA ----------------------------------

    //-- FAVORITES LIST REPOSITORY --
    Get.put<IFavoritesListRepository>(
      FavoritesListRepository(
        datasource: FavoritesListLocalDatasource(
          localStorageDriver: localStorageDriver,
        ),
      ),
      permanent: true,
    );

    //---------------------------------- DOMAIN ----------------------------------

    //-- USECASE LOAD LIST --
    Get.put<ILoadFavorites>(
      LoadFavorites(repository: Get.find<IFavoritesListRepository>()),
    );

    //-- USECASE ADD FAVORITE --
    Get.put<IAddFavorite>(
      AddFavorite(repository: Get.find<IFavoritesListRepository>()),
    );

    //-- USECASE REMOVE FAVORITE --
    Get.put<IRemoveFavorite>(
      RemoveFavorite(repository: Get.find<IFavoritesListRepository>()),
    );

    //-- USECASE FAVORITES LIST MANAGER --
    Get.put<IFavoritosListManager>(
      FavoritosListManager(
        usecaseLoadFavorites: Get.find<ILoadFavorites>(),
        usecaseAddFavorite: Get.find<IAddFavorite>(),
        usecaseRemoveFavorite: Get.find<IRemoveFavorite>(),
      ),
    );
  }
}
