part of 'route_manager_import.dart';

/// ## Manager Path Routes contain all the path of the app
/// * Example:
/// ```dart
/// static String splashScreen = '/';
/// ```
///
/// * Example:
/// ```dart
/// splashScreen: (context) => SplashScreen(),
/// ```
class RouteManager {
  RouteManager._();

  static String home = 'home';
  static String productList = 'product-list';
  static String productDetails = 'product-details';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomeScreen(),
    productList: (context) => const ProductListScreen(),
    productDetails: (context) => const ProductDetailsScreen()
  };
}
