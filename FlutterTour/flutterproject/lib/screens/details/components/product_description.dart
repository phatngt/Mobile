import 'package:flutter/material.dart';
import 'package:flutterproject/models/Products.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defautSize;

    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
          top: defaultSize * 3,
          left: defaultSize * 1.5,
          right: defaultSize * 1.5),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultSize * 1.5),
              topRight: Radius.circular(defaultSize * 1.5))),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 1.5),
            Text(
              product.description,
              style: TextStyle(
                color: kTextColor.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            SizedBox(height: defaultSize * 3),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(defaultSize * 1.2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: kPrimaryColor,
                onPressed: press,
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultSize * 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
