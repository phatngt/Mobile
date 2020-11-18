import 'package:flutter/material.dart';
import 'package:flutterproject/components/title_text.dart';
import 'package:flutterproject/models/Products.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    this.product,
    this.press,
    Key key,
  }) : super(key: key);

  final Product product;
  final Function press;
  @override
  Widget build(BuildContext context) {
    double defauldSize = SizeConfig.defautSize;
    return GestureDetector(
      onTap: press,
      child: Container(
        width: defauldSize * 12, //100
        decoration: BoxDecoration(
            color: kSecondaryColor, borderRadius: BorderRadius.circular(20)),
        child: AspectRatio(
          aspectRatio: 0.693,
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: product.id,
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/spinner.gif",
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: defauldSize),
                child: TitleText(
                  title: product.title,
                ),
              ),
              SizedBox(
                height: defauldSize / 2,
              ),
              Text("\$${product.price}"),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
