import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../lib.imports.dart';

class RESTClient {
  ///[=================== VARIAVEIS ===================]
  ///
  Dio dio = new Dio();
  Dio tokenDio = new Dio();
  int connectTimeOut = 10000;
  int receiveTimeout = 15000;

  RequestCache? cache;
  int qtdFail = 0;

  ///[=================== CONSTRUTOR ===================]

  RESTClient() {
    initCLient();
  }

  ///[=============================================================================== METODOS ===============================================================================]
  ///[=======================================================================================================================================================================]
  ///

  ///[======================================================= INIT CLIENT ======================================================]

  Future initCLient() async {
    dio.options.baseUrl = "https://pokeapi.co/api/v2/";
    dio.options.connectTimeout = connectTimeOut;
    dio.options.receiveTimeout = receiveTimeout;
    tokenDio.options = dio.options;
  }

  ///[===================================================== REQUEST METHODS =====================================================]

  ///-------------------------------- POST --------------------------------

  Future post({required String endPoint, var dataJson, bool enableJwt = false}) async {
    //Configurar chace
    cache = RequestCache(
      endPoint: endPoint,
      dataJson: dataJson,
      enableJWt: enableJwt,
      method: RequestMethod.POST,
    );

    await setHeaderJwt(enableJwt);

    try {
      Response<dynamic> response = await dio.post(
        endPoint, ////Endereco de requisicao
        data: dataJson, ////Dados passados na requisicao
      );

      return await requestSuccess(response);
    } catch (e) {
      // return await requestError(e); //// Se resultar erro, dispara a funcao de tratamento de erro
    }
  }

  ///-------------------------------- GET --------------------------------
  ///

  Future get({required String endPoint}) async {
    try {
      Response<dynamic> response = await dio.get(dio.options.baseUrl + endPoint);

      return await requestSuccess(response);
    } catch (e) {
      // return await requestError(e); //// Se resultar erro, dispara a funcao de tratamento de erro
    }
  }

  ///[===================================================== REQUEST RESULTS =====================================================]

  //---------------------------- ERRO ----------------------------

  Future requestError(DioError error) async {
    qtdFail++;
    String errorMessage = error.message;
    int errorIndex = error.type.index;
    var eMessage = error.message;

    if (errorIndex == 5 && eMessage != "token_validate") {
      return await handleConnectionError();
    }

    //[#### ERRO TOKEN NAO VALIDADO #####]
    if (eMessage == "Http status error [401]" && qtdFail < 3) {
      ///[AQUI DENTRO DO IF IRIA O PROCESSO DE REVALIDACAO DE TOKEN]
      //// *** INTERCEPTORS REALIZARÃO O TRTAMENTO ****
      // return HttpRequestResult(
      //   result: "token_validate",
      //   status: ResultStatus.error,
      // );
    } else {
      //// Se nao for erro 401 e ja foram feitas 3 novas tentativas, retorna erro.
      throw ("error");
    }
  }

  //--- TRATAR ERRO DE CONEXAO ---

  Future<HttpRequestResult> handleConnectionError() async {
    var point = "";
    throw ("connection");
  }

  //---------------------------- SUCESSO ----------------------------

  Future requestSuccess(Response response) async {
    return response.data;
  }

  ///[========================================================== UTILS ==========================================================]

  //------------------------- SETAR JWT -------------------------

  Future setHeaderJwt(bool enableJwt) async {
    if (enableJwt == false) return;

    String tokenJwt = "";
    if (tokenJwt == "" || tokenJwt == null) {
      throw ("ERRO: TOKEN JWT INVALIDO!");
    }
    dio.options.headers = {
      'Authorization': 'Bearer ' + tokenJwt.toString(),
    };
  }
}

class RequestCache {
  String endPoint;
  Map dataJson;
  bool enableJWt;
  RequestMethod method;
  RequestCache({
    required this.endPoint,
    required this.dataJson,
    required this.enableJWt,
    required this.method,
  });
}

enum RequestMethod {
  POST,
  GET,
}

class HttpRequestResult {
  ResultStatus status; ///// Indica se a requisicao foi bem sucedida
  var result;
  HttpRequestResult({
    required this.status,
    required this.result,
  });
}

enum ResultStatus {
  sucess,
  error,
  connectionFail,
}
