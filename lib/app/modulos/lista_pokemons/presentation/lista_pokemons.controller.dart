import 'package:get/get.dart';

import '../lista_pokemons.imports.dart';
import 'presentation.imports.dart';

class ListaPokemonsController {
  //
  ///Lista de pokemons
  /// - Lista geral, retornada pela API
  RxList<Pokemon> pokemonsList = <Pokemon>[].obs;

  ///Lista que armazena os pokemons salvos como favoritos (persistida localmente)
  RxList<Pokemon> favoritosList = <Pokemon>[].obs;

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
    await loadFavorites();
    await loadPokemons();
    return true;
  }

  //---------------------------------------- BIND ----------------------------------------

  static bind() {
    TotemBinding().dependencies();
  }

  //---------------------------------- LOAD POKEMON LIST ----------------------------------

  ///Faz o carregamento inicial da lista de pokemons
  Future loadPokemons() async {
    loadingList.value = true;
    IPokemonsListManager usecaseListManager = Get.find<IPokemonsListManager>(); //// Recupera a implementação do usecase que manipula a lista de pokemons.
    List<Pokemon> resultList = await usecaseListManager.loadList(); //// Dispara o metodo responsável por carregar a lista de pokemons.
    for (Pokemon pokemon in resultList) {
      pokemonsList.add(pokemon); //// Com o resultado da requisição, é populada a lista observavel.
    }
    loadingList.value = false;
  }

  //---------------------------------- LOAD FAVORITES LIST ---------------------------------

  ///Carrega a lista de favoritos
  Future loadFavorites() async {
    IFavoritosListManager favoritesListManager = Get.find<IFavoritosListManager>();
    await favoritesListManager.loadList();
  }

  //----------------------------------- FAVORITAR POKEMON ----------------------------------

  Future favoritarPokemon(Pokemon pokemonSelecionado) async {
    //
  }
}
