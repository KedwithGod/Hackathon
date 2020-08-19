
import 'package:flutter/material.dart';

import 'AdaptivePostionedWidget.dart';
import 'Generaltextdisplay.dart';

var searchWidth=0.0;
var giveWidth=1.0;
var giveWidthStart=307.0;
var learnWidth=0.0;

class ResponsiveSize {
  BuildContext context;

  ResponsiveSize(this.context);

  double height(height) {
    return MediaQuery.of(context).size.height * (height);
  }

  double width(width) {
    return MediaQuery.of(context).size.width * (width);
  }
}

BorderRadius adaptiveBorderRadius(context, {double radius}) {
  return BorderRadius.all(
    Radius.circular(
      MediaQuery.of(context).size.height * (radius / 667),
    ),
  );
}

auctionItemList(
    context,text, double textTop, double textLeft,icon,
    double iconTop, double iconLeft
    ){
  return Stack(children: <Widget>[
    AdaptivePositioned(
      left:textLeft,
      top: textTop,
      child: GeneralTextDisplay(text,
          Color.fromRGBO(51, 51, 51, 1.0), 1, 20, FontWeight.w600, 'my auction'),
    ),

    AdaptivePositioned(
        left: iconLeft,
        top: iconTop,
        child: Icon(
          icon,
          color: Colors.black,
          size:  ResponsiveSize(context).height(20 / 667),
        )),
  ],);
}


