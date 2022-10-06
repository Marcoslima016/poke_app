import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poke_app/app/app.imports.dart';

class DetalhesPokemonView {
  late double w;
  late double h;

  Pokemon pokemon;

  late DetalhesPokemonController controller;

  Future Function(Pokemon pokemonSelecionado) onTapFavorite;

  DetalhesPokemonView({
    required this.pokemon,
    required this.onTapFavorite,
  }) {
    controller = DetalhesPokemonController(
      pokemon: pokemon,
      onTapFavorite: onTapFavorite,
    );
  }

  Future showPopup() async {
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) {
        h = MediaQuery.of(context).size.height / 100;
        w = MediaQuery.of(context).size.width / 100;

        return Dialog(
          insetPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          // contentPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.5),
          child: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  ///[****************************** OUT TAP ****************************]
                  ///
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: w * 100,
                      height: h * 100,
                      color: Colors.transparent,
                    ),
                  ),

                  ///[******************************** BODY ******************************]
                  ///
                  Container(
                    height: h * 100,
                    child: PopupBody(
                      controller: controller,
                    ),
                  ),
                  //
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
