import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kib/features/helper/home_helper.dart';

import '../../common/util/constants/api_codes.dart';
import '../../common/util/constants/app_styles.dart';

class HomeScreen extends StatelessWidget with HomeHelper {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body:Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      style: AppStyles.BTN_STYLE,
                      onPressed: (){
                        goToConvertCurrency();
                      },
                      child: Text("Convert Currencies",
                        style:AppStyles.BTN_TXT_STYLE,
                      )
                  ),
                  ElevatedButton(
                      style: AppStyles.BTN_STYLE,
                      onPressed: (){
                        goToHistory();
                      },
                      child: Text("History KWD , USD",
                        style:AppStyles.BTN_TXT_STYLE,
                      )
                  )
                ],
              ),
            ),

            FutureBuilder(
                future: getCountries(),
                builder: (BuildContext context,AsyncSnapshot snapshot) {
                  if(snapshot.hasData){
                    if(countries.length>0){
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text("Countries",
                                  style: AppStyles.HEADER_TXT_STYLE
                              ),
                            ),
                            Flexible(
                                child:ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    itemCount: countries.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return ListTile(
                                        leading: CachedNetworkImage(
                                          imageUrl:  ApiBaseUrl.BASE_FLAG_IMAGE_URL+countries[index].id.toLowerCase()+".png",
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: 30,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: imageProvider, fit: BoxFit.contain
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => SizedBox(
                                              height: 30,
                                              width: 40,
                                              child: Center(child: CircularProgressIndicator())),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error,
                                                size: 30,
                                                color: Colors.grey,
                                              ),
                                        ),
                                        title: Text(countries[index].name),
                                        subtitle: Text("${countries[index].currencyName} (${countries[index].currencyId})"),
                                      );
                                    }
                                )
                            )
                          ],
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
            ),
          ],
        ),
      )
    );
  }
}
