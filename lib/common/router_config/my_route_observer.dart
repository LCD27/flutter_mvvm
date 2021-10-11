import 'package:flutter/material.dart';
import '../../utils/index.dart';

class CDRouteObserver extends NavigatorObserver {
  /// The [Navigator] pushed `route`.
  ///
  /// The route immediately below that one, and thus the previously active
  /// route, is `previousRoute`.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    LogUtil.d('${route.settings.name} ${previousRoute?.settings.name}',
        title: 'didPush');
  }

  /// The [Navigator] popped `route`.
  ///
  /// The route immediately below that one, and thus the newly active
  /// route, is `previousRoute`.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    LogUtil.d('${route.settings.name} ${previousRoute?.settings.name}',
        title: 'didPop');
    RouteSettings? previousRS = previousRoute?.settings;
    // if (previousRS != null &&
    //     previousRS.name != null &&
    //     previousRS.name!.contains(CDRoutes.main)) {
    //   // CDEventBus().emit(Constants.HOME_COLLECTIOM);
    //   // CDEventBus().emit(Constants.HOME_UPDATE);
    // }
  }

  /// The [Navigator] removed `route`.
  ///
  /// If only one route is being removed, then the route immediately below
  /// that one, if any, is `previousRoute`.
  ///
  /// If multiple routes are being removed, then the route below the
  /// bottommost route being removed, if any, is `previousRoute`, and this
  /// method will be called once for each removed route, from the topmost route
  /// to the bottommost route.
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    LogUtil.d('${route.settings.name} ${previousRoute?.settings.name}',
        title: 'didRemove');
  }

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    LogUtil.d('${newRoute?.settings.name}',title: 'didReplace');
  }

  /// The [Navigator]'s routes are being moved by a user gesture.
  ///
  /// For example, this is called when an iOS back gesture starts, and is used
  /// to disabled hero animations during such interactions.
  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    LogUtil.d('${route.settings.name}',title: 'didStartUserGesture');
  }

  /// User gesture is no longer controlling the [Navigator].
  ///
  /// Paired with an earlier call to [didStartUserGesture].
  @override
  void didStopUserGesture() {
    LogUtil.d('didStopUserGesture');
  }
}
