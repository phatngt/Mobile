import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterproject/constants.dart';
import 'package:flutterproject/debug/logger.dart';
import 'package:flutterproject/screens/home/components/body.dart';
import 'package:flutterproject/size_config.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Get size of context
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  final log = getLogger("MyApp");
  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu.svg",
            height: SizeConfig.defautSize * 1.5,
          ),
          onPressed: () {}),
      actions: <Widget>[
        IconButton(
            icon: SvgPicture.asset(
              "assets/icons/scan.svg",
              height: SizeConfig.defautSize * 2,
            ),
            onPressed: () {
              // log.v('This is a verbose');
              log.d(SizeConfig.defautSize.toString());
              // log.i("This is info, should be use for publib calls");
              // log.w("This is become a problem");
              // log.e("Something bad has happend");
            }),
        Center(
            child: Text(
          "Scan",
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        )),
        SizedBox(width: SizeConfig.defautSize),
      ],
    );
  }
}
