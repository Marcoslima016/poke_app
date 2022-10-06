import 'dart:async';
import 'package:get/get.dart';
import '../../../../lib.imports.dart';

class ListaPokemonsController {
  //
  ///Lista de pokemons
  /// - Lista geral, retornada pela API
  RxList<PokemonModel> pokemonsList = <PokemonModel>[].obs;

  ///Lista que armazena os pokemons salvos como favoritos (persistida localmente)
  RxList<PokemonModel> favoritesList = <PokemonModel>[].obs;

  ///Indica se houve erro no carregamento da lista.
  RxBool loadListError = false.obs;

  ///Indica se a lista de pokemons esta sendo recarregada
  /// - Sempre que a lista estiver sendo carregada, essa váriavel será true.
  /// - OBS: Esse indicador é utilizado tanto no carregamento da lista na inicialização do modulo,
  /// quanto no carregamento dos dados de novas páginas.
  RxBool loadingList = false.obs;

  //--------------------------------------- INIT ----------------------------------------

  ///Metodo de inicialização do modulo.
  ///- Realiza o bind e faz o carregamento da lista de pokemons
  Future<bool> init() async {
    Timer(const Duration(milliseconds: 400), () {
      ModalLoading().show();
    });

    bind();

    await _loadFavorites();
    await _loadPokemons();

    Timer(const Duration(milliseconds: 800), () {
      ModalLoading().hide();
    });

    return true;
  }

  //---------------------------------------- BIND ----------------------------------------

  static bind() {
    ListaPokemonsBinding().dependencies();
  }

  //---------------------------------- LOAD POKEMON LIST ----------------------------------

  ///Faz o carregamento inicial da lista de pokemons
  Future _loadPokemons() async {
    loadingList.value = true;
    IPokemonsListManager usecaseListManager = Get.find<IPokemonsListManager>(); //// Recupera a implementação do usecase que manipula a lista de pokemons.
    List<Pokemon> resultList = await usecaseListManager.loadList(favoritesList: favoritesList); //// Dispara o metodo responsável por carregar a lista de pokemons.
    for (Pokemon pokemon in resultList) {
      pokemonsList.add(PokemonModel.fromEntity(pokemon)); //// Com o resultado da requisição, é populada a lista observavel.
    }
    loadingList.value = false;
  }

  //---------------------------------- LOAD FAVORITES LIST ---------------------------------

  ///Carrega a lista de favoritos
  Future _loadFavorites() async {
    IFavoritosListManager usecaseFavoritesListManager = Get.find<IFavoritosListManager>();
    List<Pokemon> resultList = await usecaseFavoritesListManager.loadList();
    favoritesList.clear();
    for (Pokemon pokemon in resultList) {
      favoritesList.add(PokemonModel.fromEntity(pokemon)); //// Com o resultado, é populada a lista observavel.
    }
    favoritesList.sort((a, b) => (int.parse(a.id)).compareTo(int.parse(b.id)));
  }

  //-------------------------------------- SHOW DETAILS -------------------------------------

  ///Exibe os detalhes de um pokemon
  Future showDetails(PokemonModel pokemon) async {
    DetalhesPokemonView(
      pokemon: pokemon,
      onTapFavorite: onTapFavorite,
    ).showPopup();
  }

  //=============================================== FAVORITOS ===============================================
  //Metodos relacionados a manipulacao de favoritos
  //
  Future onTapFavorite(PokemonModel pokemonSelecionado) async {
    if (!pokemonSelecionado.isFavorite) {
      await _favoritarPokemon(pokemonSelecionado);
    } else {
      await _removerFavorito(pokemonSelecionado);
    }
  }

  //----------------------------------- FAVORITAR POKEMON ----------------------------------

  Future _favoritarPokemon(PokemonModel pokemonSelecionado) async {
    IFavoritosListManager favoritesListManager = Get.find<IFavoritosListManager>();
    await favoritesListManager.adicionarFavorito(pokemonSelecionado);
    await _loadFavorites();
    pokemonSelecionado.isFavoriteRx.value = true;
    favoritesList.sort((a, b) => (int.parse(a.id)).compareTo(int.parse(b.id)));
  }

  //------------------------------------ REMOVER FAVORITO -----------------------------------

  Future _removerFavorito(PokemonModel pokemonSelecionado) async {
    IFavoritosListManager favoritesListManager = Get.find<IFavoritosListManager>();
    await favoritesListManager.removerFavorito(pokemonSelecionado);
    await _loadFavorites();
    pokemonSelecionado.isFavoriteRx.value = false;
    favoritesList.sort((a, b) => (int.parse(a.id)).compareTo(int.parse(b.id)));
  }
}
