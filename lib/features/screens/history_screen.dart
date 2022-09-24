import 'package:flutter/material.dart';

import '../../common/util/constants/app_styles.dart';
import '../helper/history_helper.dart';

class HistoryScreen extends StatelessWidget with HistoryHelper {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body:Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("History KWD , USD",
                      style: AppStyles.HEADER_TXT_STYLE
                  ),
                ),
                FutureBuilder(
                    future: fetchCountries(),
                    builder: (BuildContext context,AsyncSnapshot snapshot) {
                      if(snapshot.hasData){
                        if(history.length>0){
                          return Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                children: history.map((item){
                                  return ListTile(
                                    title: Text(item.date),
                                    subtitle: Text(item.value.toStringAsFixed(2)),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        }else{
                          return Expanded(
                              child: Center(child: Text('There is no countries'),
                              )
                          );
                        }
                      }else if(snapshot.hasError){
                        return Expanded(
                            child: Center(child: Text('Error\nplease try again later'),
                            )
                        );
                      }else{
                        return Expanded(
                            child: Center(child: CircularProgressIndicator(),
                            )
                        );
                      }
                    }
                )
              ]
          )
        )
    );
  }
}
