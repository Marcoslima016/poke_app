import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../presentation.imports.dart';
import 'widgets.imports.dart';

///Widget referente ao conteúdo que é exibido após sucesso no carregamento.
class Content extends StatelessWidget {
  late ListaPokemonsController controller;

  Content() {
    controller = Get.find<ListaPokemonsController>();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;

    return DefaultTabController(
      length: 2,
      child: Container(
        width: w * 100,
        height: h * 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //-------------------- MENU ABAS --------------------
            const TabBar(
              indicatorColor: Colors.green,
              labelColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Icon(Icons.list, color: Colors.grey),
                  text: "Todos Pokemons",
                ),
                Tab(
                  icon: Icon(Icons.favorite, color: Colors.grey),
                  text: "Favoritos",
                ),
              ],
            ),
            //------------------- PAGINAS ABAS -------------------
            Expanded(
              child: TabBarView(
                children: [
                  ListaGeral(),
                  ListaDeFavoritos(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
