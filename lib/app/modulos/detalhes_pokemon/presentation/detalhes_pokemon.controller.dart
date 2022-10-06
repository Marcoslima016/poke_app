import 'package:get/get.dart';

import '../../modulos.imports.dart';

class DetalhesPokemonController {
  PokemonModel pokemon;

  RxBool isFavorite = false.obs;

  Future Function(PokemonModel pokemonSelecionado) callbackOnTapFavorite;

  DetalhesPokemonController({
    required this.pokemon,
    required this.callbackOnTapFavorite,
  });

  Future init() async {
    DetalhesPokemonBinding().dependencies();
    await _checkFavoriteStatus();
    await _checkDetailsData();
    return true;
  }

  //--------------------------------------------------- CHECK DETAILS ---------------------------------------------------

  ///Verifica se a entidade Pokemon ja possui o parametro 'details'
  /// - Essa verificação é necessária porque quando o detalhes é disparado via um item dos favoritos, ele ja possui os dados de detalhes,
  /// diferente do que ocorre ao chamar detalhes via um item da lista geral.
  Future _checkDetailsData() async {
    if (pokemon.details == null) {
      await _loadPokemonDetails();
    }
  }

  //--------------------------------------------------- LOAD DETAILS ---------------------------------------------------

  ///Consulta a API para recuperar os dados de detalhes
  Future _loadPokemonDetails() async {
    ILoadPokemonDetails usecaseLoadDetails = Get.find<ILoadPokemonDetails>();
    PokemonDetails details = await usecaseLoadDetails.call(pokemon);
    pokemon.details = details;
  }

  //--------------------------------------------------- CHECK FAVORITE ---------------------------------------------------

  Future _checkFavoriteStatus() async {
    if (pokemon.isFavorite) isFavorite.value = true;
  }

  //-------------------------------------------------- ON TAP FAVORITE --------------------------------------------------

  Future onTapFavorite() async {
    await callbackOnTapFavorite(pokemon);
    isFavorite.value = !isFavorite.value;
  }
}
