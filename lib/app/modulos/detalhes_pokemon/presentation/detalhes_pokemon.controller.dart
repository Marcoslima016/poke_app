import 'package:get/get.dart';

import '../../modulos.imports.dart';

class DetalhesPokemonController {
  Pokemon pokemon;

  Future Function(Pokemon pokemonSelecionado) onTapFavorite;

  DetalhesPokemonController({
    required this.pokemon,
    required this.onTapFavorite,
  });

  Future init() async {
    DetalhesPokemonBinding().dependencies();
    await checkDetailsData();
    return true;
  }

  //--------------------------------------------------- CHECK DETAILS ---------------------------------------------------

  ///Verifica se a entidade Pokemon ja possui o parametro 'details'
  /// - Essa verificação é necessária porque quando o detalhes é disparado via um item dos favoritos, ele ja possui os dados de detalhes,
  /// diferente do que ocorre ao chamar detalhes via um item da lista geral.
  Future checkDetailsData() async {
    if (pokemon.details == null) {
      await loadPokemonDetails();
    }
  }

  //--------------------------------------------------- CHECK DETAILS ---------------------------------------------------

  ///Consulta a API para recuperar os dados de detalhes
  Future loadPokemonDetails() async {
    ILoadPokemonDetails usecaseLoadDetails = Get.find<ILoadPokemonDetails>();
    PokemonDetails details = await usecaseLoadDetails.call(pokemon);
    pokemon.details = details;
  }
}
