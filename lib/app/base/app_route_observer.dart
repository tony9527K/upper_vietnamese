import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AppRouteObserver<R extends Route<dynamic>> extends RouteObserver<R> {
  AppRouteObserver._();

  static final routeObserver = AppRouteObserver<ModalRoute<void>>._();

  final _histories = <Route>[];

  List<Route> get histories => _histories.toList();

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route is GetPageRoute) {
      if (previousRoute == null) {
        _histories.clear();
      }
      _histories.add(route);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      while (_histories.isNotEmpty &&
          _histories.last.settings.name != previousRoute?.settings.name) {
        _histories.removeLast();
      }
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      _histories.removeWhere(
            (element) => element.settings.name == route.settings.name,
      );
    }
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute?.settings.name != null) {
      final index = _histories.indexOf(oldRoute!);
      if (index > 0) {
        _histories.replaceRange(
          index,
          index + 1,
          [newRoute!],
        );
      }
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
