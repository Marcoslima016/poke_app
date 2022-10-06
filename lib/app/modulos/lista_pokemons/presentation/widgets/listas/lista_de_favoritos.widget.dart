import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../lib.imports.dart';
import '../../../lista_pokemons.imports.dart';
import '../../presentation.imports.dart';

class ListaDeFavoritos extends StatelessWidget {
  late ListaPokemonsController controller;

  ListaDeFavoritos() {
    controller = Get.find<ListaPokemonsController>();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;

    return Container(
      width: w * 100,
      height: h * 60,
      child: Obx(() {
        if (controller.loadingList.value == false) {
          //
          //---------------------- EXIBIR LISTA ----------------------

          if (controller.favoritesList.isNotEmpty) {
            return ListView.builder(
              itemCount: controller.favoritesList.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  PokemonModel itemPokemon = controller.favoritesList[index];

                  return CardResumoPokemon(
                    controller: controller,
                    itemPokemon: itemPokemon,
                  );
                });
              },
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(left: w * 8, right: w * 9, bottom: h * 11),
                child: Text(
                  "Sua lista de favoritos esta vazia. Adicione um pokemon como favorito para poder ver quando estiver sem internet.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[350],
                  ),
                ),
              ),
            );
          }
        } else {
          //
          //---------------------- EXIBIR LOADING ----------------------

          return Column(
            children: [
              SizedBox(
                width: w * 10,
                height: w * 10,
                child: const CircularProgressIndicator(
                  backgroundColor: Colors.green,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(height: 22),
              Text(
                "Carregando lista",
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          );
        }
      }),
    );
  }
}
