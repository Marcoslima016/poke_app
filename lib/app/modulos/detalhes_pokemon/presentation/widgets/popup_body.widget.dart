import 'package:flutter/material.dart';

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
              top: w * 4,
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
                  //------- Carregando -------

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
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
