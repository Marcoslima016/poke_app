import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../lista_pokemons.imports.dart';
import '../../../presentation.imports.dart';

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

        if (controller.loadingList.value == false) {
          //
          //------------------------------------------------------ EXIBIR LISTA ------------------------------------------------------

          return Container(
            padding: EdgeInsets.only(left: w * 6, right: w * 6),
            child: ListView.builder(
              itemCount: controller.pokemonsList.length,
              itemBuilder: (context, index) {
                return Obx(() {
                  Pokemon itemPokemon = controller.pokemonsList[index];
                  var p = "";

                  //----------------------------- CARD -----------------------------
                  return Container(
                    margin: EdgeInsets.only(top: h * 2.2),
                    width: w * 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[200]!),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200]!.withOpacity(0.8),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(1.8, 1.8), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //---------- IMAGEM ----------
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                              child: Container(
                                width: w * 16,
                                height: w * 16,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: const BorderRadius.all(Radius.circular(3.2)),
                                ),
                                child: Image.network(
                                  itemPokemon.imgURL,
                                ),
                              ),
                            ),

                            //----------- Nome -----------

                            SizedBox(width: w * 4),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringUtils.capitalize(itemPokemon.nome),
                                  style: TextStyle(
                                    fontFamily: "NunitoBlack",
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "ID: " + itemPokemon.id,
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        //--------- BTN VER MAIS ---------

                        Padding(
                          padding: EdgeInsets.only(right: w * 3.2),
                          child: GestureDetector(
                            onTap: () {
                              controller.showDetails(itemPokemon);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              child: Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.grey[350],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
              },
            ),
          );
        } else {
          //
          //---------------------------------------------------- EXIBIR LOADING ----------------------------------------------------

          return Container();
        }
      }),
    );
  }
}
