import 'package:flutter/material.dart';
import 'package:flutterproject/components/title_text.dart';
import 'package:flutterproject/screens/home/components/recommend_products.dart';
import 'package:flutterproject/services/fetch_categories.dart';
import 'package:flutterproject/services/fetch_products.dart';
import 'package:flutterproject/size_config.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defauldSize = SizeConfig.defautSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defauldSize * 1),
              child: TitleText(
                title: "Browser by Categories",
              ),
            ),
            FutureBuilder(
                future: fetchCategories(),
                builder: (context, snapshot) => snapshot.hasData
                    ? Categories(categories: snapshot.data)
                    : Center(child: Image.asset("assets/ripple.gif"))),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defauldSize),
              child: TitleText(
                title: "Recommend for you",
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommendProducts(
                        products: snapshot.data,
                      )
                    : Center(child: Image.asset("assets/ripple.gif"));
              },
            )
          ],
        ),
      ),
    );
  }
}
