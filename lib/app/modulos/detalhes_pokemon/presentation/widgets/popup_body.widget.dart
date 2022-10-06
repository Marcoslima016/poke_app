import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../lib.imports.dart';
import '../presentation.imports.dart';

class PopupBody extends StatelessWidget {
  DetalhesPokemonController controller;

  PopupBody({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;
    return Container(
      width: w * 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: w * 85,
            padding: EdgeInsets.only(
              left: w * 4.4,
              right: w * 4.4,
              top: w * 4.4,
              bottom: w * 4,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: FutureBuilder(
              future: controller.init(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  //
                  //------------------------------------------------ Carregando ------------------------------------------------
                  //Widget exibido enquanto os dado estao sendo carregados

                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 8),
                    child: Column(
                      children: [
                        SizedBox(
                          width: w * 12,
                          height: w * 12,
                          child: const CircularProgressIndicator(
                            backgroundColor: Colors.green,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        ),
                        const SizedBox(height: 22),
                        Text(
                          "Carregando detalhes do Pokemon",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                      ],
                    ),
                  );
                } else {
                  //------------------------------------------------- CONTEUDO -------------------------------------------------

                  return Column(
                    children: [
                      //----------------------- CARD SUPERIOR -----------------------

                      PrimaryCard(
                        marginTop: 0,
                        child: Column(
                          children: [
                            //
                            SizedBox(height: h * 2.5),

                            Container(
                              width: w * 100,
                              child: Stack(
                                children: [
                                  //----- INDICADOR/BOTAO FAVORITO -----

                                  Positioned(
                                    left: w * 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.onTapFavorite();
                                      },
                                      child: Obx(() {
                                        if (controller.isFavorite.value) {
                                          return const Icon(
                                            Icons.favorite,
                                            size: 25,
                                            color: Colors.yellow,
                                          );
                                        } else {
                                          return Icon(
                                            Icons.favorite_border,
                                            size: 25,
                                            color: Colors.grey[350],
                                          );
                                        }
                                      }),
                                    ),
                                  ),

                                  //--------- IMAGEM ---------

                                  Center(
                                    child: Container(
                                      width: w * 30,
                                      height: w * 30,
                                      decoration: BoxDecoration(
                                        // color: Colors.grey[200],
                                        border: Border.all(color: Colors.grey[300]!),
                                        borderRadius: const BorderRadius.all(Radius.circular(200)),
                                      ),
                                      child: Image.network(
                                        controller.pokemon.imgURL,
                                        scale: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //--------- NOME ---------

                            SizedBox(height: h * 2.5),

                            Text(
                              StringUtils.capitalize(controller.pokemon.nome),
                              style: TextStyle(
                                fontFamily: "NunitoBlack",
                                fontWeight: FontWeight.w900,
                                fontSize: 21,
                                color: Colors.grey[800],
                              ),
                            ),

                            SizedBox(height: h * 3.5),
                          ],
                        ),
                      ),

                      // const SizedBox(height: 35),

                      //-------------------------------- CARD DADOS --------------------------------

                      PrimaryCard(
                        marginTop: h * 1.5,
                        // child: SizedBox(
                        //   width: w * 100,
                        //   height: h * 25,
                        // ),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 12, top: 12),
                                  child: Text(
                                    "Detalhes",
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Divider(
                              color: Colors.grey[300],
                            ),
                            SizedBox(
                              height: h * 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
