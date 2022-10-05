import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../lista_pokemons.imports.dart';
import '../../presentation.imports.dart';

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
        var p = "";
        return ListView.builder(
          itemCount: controller.pokemonsList.length,
          itemBuilder: (context, index) {
            return Obx(() {
              Pokemon item = controller.pokemonsList[index];
              var p = "";
              return Card(
                margin: EdgeInsets.all(20),
                child: ListTile(
                  title: Text(item.nome),
                  trailing: RaisedButton(
                    child: Text("Favoritar/Desfavoritar"),
                    onPressed: () {
                      // controller.ativarDesativar(item.id);
                    },
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }
}
