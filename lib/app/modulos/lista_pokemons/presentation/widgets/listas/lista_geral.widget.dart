import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../lib.imports.dart';

class ListaGeral extends StatelessWidget {
  late ListaPokemonsController controller;

  ListaGeral() {
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
          //----------------------------------- EXIBIR LISTA -----------------------------------

          return Container(
            padding: EdgeInsets.only(left: w * 6, right: w * 6),
            child: ListView.builder(
              itemCount: controller.pokemonsList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () {
                    PokemonModel itemPokemon = controller.pokemonsList[index];

                    //------------ CARD ------------

                    return CardResumoPokemon(
                      controller: controller,
                      itemPokemon: itemPokemon,
                    );
                  },
                );
              },
            ),
          );
        } else {
          //
          //----------------------------------- EXIBIR LOADING -----------------------------------

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
