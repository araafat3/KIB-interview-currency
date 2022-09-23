import '../../main.dart';

class Navigation {
  static Navigation? singleton;

  factory Navigation() {
    singleton = singleton ?? Navigation._internal();
    return singleton!;
  }

  Navigation._internal();

  Future<dynamic> navigateTo({required String routeName, Object? arg}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arg);
  }
}