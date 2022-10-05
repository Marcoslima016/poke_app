import 'package:flutter/material.dart';

///Widget referente ao conteúdo que é exibido após sucesso no carregamento.
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height / 100;
    double w = MediaQuery.of(context).size.width / 100;
    return Container(
      width: w * 100,
      height: h * 100,
    );
  }
}
