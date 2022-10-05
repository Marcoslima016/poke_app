import 'package:get/get.dart';

import '../lista_pokemons.imports.dart';
import 'presentation.imports.dart';

class ListaPokemonsController {
  RxList<Pokemon> pokemonsList = <Pokemon>[].obs;

  RxBool loadListError = false.obs;

  //---------------------------------------- INIT ----------------------------------------

  ///Metodo de inicialização do modulo. Realiza o bind e faz o carregamento da lista de pokemons
  Future<bool> init() async {
    bind();
    await loadPokemons();
    return true;
  }

  //---------------------------------------- BIND ----------------------------------------

  static bind() {
    TotemBinding().dependencies();
  }

  //-------------------------------------- LOAD LIST --------------------------------------

  Future loadPokemons() async {
    IPokemonsListManager usecaseListManager = Get.find<IPokemonsListManager>(); //// Recupera a implementação do usecase que manipula a lista.
    List<Pokemon> resultList = await usecaseListManager.loadList(); //// Dispara o metodo responsável por carregar a lista de pokemons.
    for (Pokemon pokemon in resultList) {
      pokemonsList.add(pokemon); //// Com o resultado da requisição, é populada a lista observavel.
    }
  }

  //----------------------------------- FAVORITAR POKEMON ----------------------------------

  Future favoritarPokemon() async {
    //
  }
}
