import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';

import 'base_page.dart';

abstract class BaseModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  BaseModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  })  : _routers = routers,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => BasePage(
          bindings: _bindings,
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage<T>(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return BasePage(
        page: widgetBuilder,
        bindings: _bindings,
      );
    }

    throw Exception();
  }
}
