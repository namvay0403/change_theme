import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({
    Key? key,
    this.isNight = false,
    required Widget child,
  }) : super(key: key, child: child);

  bool isNight;

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.isNight != isNight;
  }
}
