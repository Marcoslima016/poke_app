import 'package:get/get.dart';

import '../../../core/core.imports.dart';
import '../lista_pokemons.imports.dart';

class TotemBinding extends Bindings {
  @override
  void dependencies() {
    //
    //-- CLIENTS --
    RESTClient restClient = RESTClient();

    //----------------------------------- DATA ----------------------------------

    //-- POKEMONS LIST REPOSITORY --
    Get.put<IPokemonsListRepo>(
      PokemonsListRepository(pokemonsListDatasource: PokemonsListRESTDatasource()),
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
  }
}
