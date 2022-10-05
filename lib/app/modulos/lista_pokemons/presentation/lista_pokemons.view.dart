import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation.imports.dart';

class ListaPokemonsView extends StatelessWidget {
  //
  late ListaPokemonsController controller;

  ListaPokemonsView({Key? key}) : super(key: key) {
    controller = ListaPokemonsController();
    Get.put<ListaPokemonsController>(controller, permanent: true);
  }

  //=========================================== WIDGET BUILD ===========================================
  @override
  Widget build(BuildContext context) {
    var p = "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Poke APP"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: controller.init(), //// FutureBuilder dispara a inicialização do modulo
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //
            //--------------------------- CARREGAMENTO FINALIZADO ----------------------------
            // Quando o Future retornar um result, significa que o carregamento foi concluído.

            if (controller.loadListError.value == true) {
              //
              //----- ERRO NO CARREGAMENTO ------
              //
              return Container();
            } else {
              //--- LISTA CARREGADA C SUCESSO ---
              //
              return Content();
            }
          } else {
            //-------------------------- LOADING (CARREGANDO LISTA) --------------------------
            // Enquanto o future não retornar resultado, signica que o carregamento esta em progresso
            //
            return Container();
          }
        },
      ),
    );
  }
}
