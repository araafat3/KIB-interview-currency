import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../util/constants/app_styles.dart';

class CurrencyPicker extends StatefulWidget {
  // final Function(String) onSelectCurrency;
  final TextEditingController currencyController;
  const CurrencyPicker({required this.currencyController}); //,required this.onSelectCurrency

  @override
  _CurrencyPickerState createState() => _CurrencyPickerState();
}

class _CurrencyPickerState extends State<CurrencyPicker> {

  _selectCurrency() async {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showSearchField: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        widget.currencyController.text=currency.code;
      },
      favorite: ['KWD'],
    );
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: widget.currencyController,
      style: AppStyles.hintStyle,
      cursorColor:Colors.white,
      readOnly: true,
      decoration: InputDecoration(
        hintText:  "select currency",
        hintStyle: AppStyles.hintStyle,
        filled: false,
        isDense: true,
        focusedBorder: AppStyles.underlineInputBorder,
        enabledBorder: AppStyles.underlineInputBorder,
        border: AppStyles.underlineInputBorder,
      ),
      onTap: () async{
        _selectCurrency();
      },
    );
  }
}