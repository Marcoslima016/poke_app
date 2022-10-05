import 'package:get/get.dart';
import '../../../core/core.imports.dart';
import '../detalhes_pokemon.imports.dart';

class DetalhesPokemonBinding extends Bindings {
  @override
  void dependencies() {
    //
    //-- CLIENTS --
    RESTClient restClient = RESTClient();

    //=============================================== CORE ===============================================

    //----------------------------------- DATA ----------------------------------

    //-- DETAILS REPOSITORY --
    Get.put<IPokemonDetailsRepository>(
      PokemonDetailsRepository(datasource: PokemonDetailsRestDatasource()),
      permanent: true,
    );

    //---------------------------------- DOMAIN ----------------------------------

    Get.put<ILoadPokemonDetails>(
      LoadPokemonDetails(
        repository: Get.find<IPokemonDetailsRepository>(),
      ),
    );
  }
}
