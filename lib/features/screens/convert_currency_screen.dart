import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kib/common/util/constants/app_styles.dart';

import '../../common/widget/currency_picker.dart';
import '../helper/convert_currency_helper.dart';

class ConvertCurrencyScreen extends StatefulWidget{
  const ConvertCurrencyScreen({Key? key}) : super(key: key);

  @override
  State<ConvertCurrencyScreen> createState() => _ConvertCurrencyScreenState();
}

class _ConvertCurrencyScreenState extends State<ConvertCurrencyScreen> with ConvertCurrencyHelper{
  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  dispose() {
    disposeState();
    return super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Convert currency"),
        ),
        body:Container(
          child:  Padding(
            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: CurrencyPicker(
                          currencyController: currencyController1,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: CurrencyPicker(
                          currencyController: currencyController2,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: TextField(
                          textAlign: TextAlign.center,
                          style: AppStyles.hintStyle,
                          controller: amountController,
                          cursorColor: Colors.black,
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))],
                          decoration: new InputDecoration(
                            hintText: "0",
                            filled: false,
                            isDense: true,
                            focusedBorder: AppStyles.underlineInputBorder,
                            enabledBorder: AppStyles.underlineInputBorder,
                            errorBorder: AppStyles.underlineInputBorder,
                            disabledBorder: AppStyles.underlineInputBorder,
                            // contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                            style: AppStyles.BTN_STYLE,
                            onPressed: (){
                              fetchConvert();
                            },
                            child: Text("Convert",
                              style:AppStyles.BTN_TXT_STYLE,
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                
                StreamBuilder(
                    stream: convertCurrencyController.stream,
                    builder: (context, AsyncSnapshot snapshot) {
                      return Text(
                        converterAmount.toStringAsFixed(2),
                        style: AppStyles.HEADER_TXT_STYLE,
                      );
                    }
                )
              ],
            ),
          ),
        ),
    );
  }
}
