import 'package:flutter/material.dart';
import 'package:flutterproject/models/Products.dart';
import 'package:flutterproject/screens/details/components/product_description.dart';
import 'package:flutterproject/screens/details/components/product_info.dart';
import 'package:flutterproject/size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defautSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 27.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 2.5,
              right: -defaultSize * 0.3,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: defaultSize * 25,
                  width: defaultSize * 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
