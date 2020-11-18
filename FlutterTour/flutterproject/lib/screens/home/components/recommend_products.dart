import 'package:flutter/material.dart';
import 'package:flutterproject/models/Products.dart';
import 'package:flutterproject/screens/details/details_screen.dart';
import 'package:flutterproject/screens/home/components/product_card.dart';

import '../../../size_config.dart';

class RecommendProducts extends StatelessWidget {
  const RecommendProducts({
    Key key,
    this.products,
  }) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    double defauldSize = SizeConfig.defautSize;
    return Padding(
      padding: EdgeInsets.all(defauldSize),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.65,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount:
                SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          ),
          itemBuilder: (context, index) => ProductCard(
                product: products[index],
                press: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                        ),
                      ));
                },
              )),
    );
  }
}
