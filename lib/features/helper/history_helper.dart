import 'dart:convert';

import 'package:dio/dio.dart';

import '../../common/helper/network_layer.dart';
import '../../common/util/constants/api_codes.dart';
import '../../common/util/constants/app_data.dart';
import 'package:intl/intl.dart';

import '../model/history_model.dart';

class HistoryHelper{
  DateFormat _dateFormat = DateFormat("yyyy-MM-dd");
  DateTime _currentDate = DateTime.now();
  late Map historyModel;
  late List<History> history;

  fetchCountries() async {
    try{
      final response = await NetworkLayer().dioGet(
          apiPath: ApiCodes.CONVERT_CURRENCY,
          queryParameters: {
            "q":"KWD_USD",
            "compact":"ultra",
            "date":_dateFormat.format(_currentDate.subtract(Duration(days: 7))),
            "endDate":_dateFormat.format(_currentDate),
            "apiKey":AppData.API_KEY}
      );
      historyModel= response;
      history = List<History>.from(historyModel["KWD_USD"].entries.map( (entry) =>  History(date: entry.key,value: entry.value)).toList());
      return historyModel;
    } on DioError catch(error){

    }
  }

}