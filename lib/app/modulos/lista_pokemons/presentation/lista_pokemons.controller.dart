import 'package:get/get.dart';

import '../lista_pokemons.imports.dart';
import 'presentation.imports.dart';

class ListaPokemonsController {
  RxList<Pokemon> pokemonsList = <Pokemon>[].obs;

  ///Indica se houve erro no carregamento da lista.
  RxBool loadListError = false.obs;

  ///Indica se a lista de pokemons esta sendo recarregada
  /// - Sempre que a lista estiver sendo carregada, essa váriavel será true.
  /// - OBS: Esse indicador é utilizado tanto no carregamento da lista na inicialização do modulo,
  /// quanto no carregamento dos dados de novas páginas.
  RxBool loadingList = false.obs;

  //---------------------------------------- INIT ----------------------------------------

  ///Metodo de inicialização do modulo.
  ///- Realiza o bind e faz o carregamento da lista de pokemons
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

  ///Faz o carregamento inicial da lista de pokemons
  Future loadPokemons() async {
    loadingList.value = true;
    IPokemonsListManager usecaseListManager = Get.find<IPokemonsListManager>(); //// Recupera a implementação do usecase que manipula a lista.
    List<Pokemon> resultList = await usecaseListManager.loadList(); //// Dispara o metodo responsável por carregar a lista de pokemons.
    for (Pokemon pokemon in resultList) {
      pokemonsList.add(pokemon); //// Com o resultado da requisição, é populada a lista observavel.
    }
    loadingList.value = false;
  }

  //----------------------------------- FAVORITAR POKEMON ----------------------------------

  Future favoritarPokemon() async {
    //
  }
}
