import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../common/helper/network_layer.dart';
import '../../common/util/constants/api_codes.dart';
import '../../common/util/constants/app_data.dart';

abstract class ConvertCurrencyHelper{
  late TextEditingController currencyController1;
  late TextEditingController currencyController2;
  late TextEditingController amountController;

  late StreamController convertCurrencyController;

  num converterAmount=0;

  init(){
    currencyController1 = new TextEditingController(text: "KWD");
    currencyController2 = new TextEditingController(text: "USD");
    amountController = new TextEditingController(text: "1");

    convertCurrencyController=StreamController();
  }

  disposeState(){
    currencyController1.dispose();
    currencyController2.dispose();
    amountController.dispose();

    convertCurrencyController.close();
  }

  fetchConvert() async {
    try{
      final response = await NetworkLayer().dioGet(
          apiPath: ApiCodes.CONVERT_CURRENCY,
          queryParameters: {
            "q":"${currencyController1.text}_${currencyController2.text}",
            "compact":"ultra",
            "apiKey":AppData.API_KEY}
      );
      converterAmount=response["${currencyController1.text}_${currencyController2.text}"] * double.parse(amountController.text.isEmpty?"0":amountController.text);
      convertCurrencyController.sink.add(converterAmount);
      return response;
    } on DioError catch(error){
      rethrow;
    }
  }

}