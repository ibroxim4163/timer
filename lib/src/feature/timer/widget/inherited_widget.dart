import 'package:flutter/material.dart';

import 'data_provider.dart';

class Provider extends InheritedWidget {
  final DataProvider dataProvider;
  const Provider({
    required super.child,
    required this.dataProvider,
    super.key,
  });

  static DataProvider of(BuildContext context, [bool listen = true]) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<Provider>()!
          .dataProvider;
    } else {
      return (context
              .getElementForInheritedWidgetOfExactType<Provider>()!
              .widget as Provider)
          .dataProvider;
    }
  }

  @override
  bool updateShouldNotify(Provider oldWidget) =>
      dataProvider != oldWidget.dataProvider;
}
