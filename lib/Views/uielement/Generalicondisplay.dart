import 'package:flutter/material.dart';
import 'package:hackthon/Views/uielement/sharedFile.dart';


class GeneralIconDisplay extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Key iconKey;

  GeneralIconDisplay(this.icon, this.iconColor, this.iconKey, this.iconSize);

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return SafeArea(
        child: Icon(
      icon,
      key: iconKey,
      size:dynamicSize.height(iconSize),
      color: iconColor,
    ));
  }
}
