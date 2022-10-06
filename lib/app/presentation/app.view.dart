import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../modulos/lista_pokemons/lista_pokemons.imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaPokemonsView(
        key: key,
      ),
    );
  }
}
