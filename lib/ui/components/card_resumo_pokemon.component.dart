import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../lib.imports.dart';

class CardResumoPokemon extends StatelessWidget {
  ListaPokemonsController controller;
  PokemonModel itemPokemon;

  CardResumoPokemon({
    required this.controller,
    required this.itemPokemon,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;

    return PrimaryCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //
              //----------------- IMAGEM -----------------
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

              SizedBox(width: w * 4),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //
                      //----------------- Nome -----------------
                      Text(
                        StringUtils.capitalize(itemPokemon.nome),
                        style: TextStyle(
                          fontFamily: "NunitoBlack",
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          color: Colors.grey[800],
                        ),
                      ),

                      //------------- INDICADOR FAVORITO -------------

                      Obx(() {
                        if (itemPokemon.isFavoriteRx.value) {
                          return Container(
                            margin: const EdgeInsets.only(left: 4),
                            child: Icon(Icons.favorite, color: Colors.yellow, size: h * 2.6),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                  //
                  //------------ ID DO POKEMON ------------
                  //
                  const SizedBox(height: 2),

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
            padding: EdgeInsets.only(right: w * 2.5),
            child: GestureDetector(
              onTap: () {
                controller.showDetails(itemPokemon);
              },
              child: Container(
                padding: const EdgeInsets.all(10),
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
  }
}
