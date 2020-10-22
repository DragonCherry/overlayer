library overlayer;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/rendering.dart';

extension WidgetOverlayable on Widget {
  Widget dimmed(
      {final Color color = Colors.black,
      final double alpha = 0.5,
      final Widget child,
      final Alignment alignment = Alignment.center}) {
    return Stack(children: [
      this,
      Positioned.fill(
          child: Opacity(
              opacity: alpha,
              child: Container(
                  color: color,
                  child: Align(child: child, alignment: alignment))))
    ]);
  }

  Widget overlaid(
      {@required final Widget child,
      final Alignment alignment = Alignment.center}) {
    return Stack(children: [
      Container(child: this),
      Align(child: child, alignment: alignment)
    ]);
  }
}
