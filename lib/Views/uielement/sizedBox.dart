
import 'package:flutter/material.dart';
import 'package:hackthon/Views/uielement/sharedFile.dart';


class AdaptiveSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const AdaptiveSizedBox({ this.height, this.width, this.child})
      ;

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return SizedBox(
        height: dynamicSize.height(height??0.0),
        width: dynamicSize.width(width??0.0),
        child: child);
  }
}
