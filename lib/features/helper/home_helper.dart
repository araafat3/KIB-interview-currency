import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kib/common/util/constants/api_codes.dart';
import 'package:kib/common/util/constants/app_data.dart';

import '../../common/helper/local_storage.dart';
import '../../common/helper/navigation.dart';
import '../../common/helper/network_layer.dart';
import '../../common/util/constants/route_name.dart';
import '../../common/util/constants/storage_keys.dart';
import '../model/countries_model.dart';

abstract class HomeHelper{
  late Map countriesModel;
  late var _countriesList;
  late List<CountriesModel> countries;


  fetchCountries() async {
    try{
      final response = await NetworkLayer().dioGet(
          apiPath: ApiCodes.GET_COUNTRIES,
        queryParameters: {"apiKey":AppData.API_KEY}
      );
      countriesModel= response;
      _countriesList = countriesModel["results"].entries.map( (entry) =>  entry.value).toList();
      countries=countriesModelFromJson(jsonEncode(_countriesList));
      LocalStorage().writeOnStorage(key: Storagekeys.COUNTRIES,data: countriesModel);
      return countriesModel;
    } on DioError catch(error){

    }
  }

  getCountries() async {
    var storageCountires =LocalStorage().readFromStorage(key: Storagekeys.COUNTRIES);
    if(storageCountires!=null){
      countriesModel= storageCountires;
      _countriesList = countriesModel["results"].entries.map( (entry) =>  entry.value).toList();
      countries=countriesModelFromJson(jsonEncode(_countriesList));
      return countriesModel;
    }else {
      await fetchCountries();
      return countriesModel;
    }
  }

  goToConvertCurrency() {
    Navigation().navigateTo(routeName: RoutesNames.CONVERT_CURRENCY_ROUTE);
  }

  goToHistory(){
    Navigation().navigateTo(routeName: RoutesNames.HISTORY_ROUTE);
  }
}