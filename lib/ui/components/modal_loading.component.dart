import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalLoading {
  LoadContext loadContext = LoadContext.instance;

  ///[=================== EXIBIR LOAD ===================]

  Future show() async {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        loadContext.context = context;
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                backgroundColor: Colors.green,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        );
      },
    );
    await Future.delayed(const Duration(milliseconds: 600), () {});
  }

  ///[==================== FECHAR LOAD ====================]

  Future hide() async {
    Navigator.pop(loadContext.context!);
  }
}

class LoadContext {
  static final LoadContext instance = LoadContext._();
  BuildContext? context;
  LoadContext._({
    this.context,
  });
}
