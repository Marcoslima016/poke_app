import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../lista_pokemons.imports.dart';
import '../../../presentation.imports.dart';

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
        var p = "";

        if (controller.loadingList.value == false) {
          //
          //---------------------- EXIBIR LISTA ----------------------

          return ListView.builder(
            itemCount: controller.favoritesList.length,
            itemBuilder: (context, index) {
              return Obx(() {
                Pokemon itemPokemon = controller.favoritesList[index];
                var p = "";
                return Card(
                  margin: EdgeInsets.all(20),
                  child: ListTile(
                    title: Text(itemPokemon.nome),
                    trailing: RaisedButton(
                      child: Text("Favoritar/Desfavoritar"),
                      onPressed: () {
                        controller.favoritarPokemon(itemPokemon);
                      },
                    ),
                  ),
                );
              });
            },
          );
        } else {
          //
          //---------------------- EXIBIR LOADING ----------------------

          return Container();
        }
      }),
    );
  }
}
