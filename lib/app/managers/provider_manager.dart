import 'package:marboket_app/app/stores/app_store.dart';
import 'package:marboket_app/products/stores/item_unit_store.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderManager {
  ProviderManager._();

  static List<SingleChildWidget> providers = [
    Provider(create: (_) => AppStore()),
    Provider(create: (_) => ProductStore()),
    Provider(create: (_) => ItemUnitStore())
  ];
}
