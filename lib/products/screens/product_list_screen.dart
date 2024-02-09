import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marboket_app/app/widgets/loading_indicator.dart';
import 'package:marboket_app/products/models/product.dart';
import 'package:marboket_app/products/stores/item_unit_store.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:marboket_app/products/widgets/product_create_form.dart';
import 'package:marboket_app/products/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:marboket_app/app/extensions/double_extensions.dart';
import 'package:marboket_app/app/extensions/string_extensions.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late ProductStore productStore;
  late ItemUnitStore itemUnitStore;

  @override
  void initState() {
    super.initState();

    productStore = context.read();
    productStore.fetchList();
    itemUnitStore = context.read();
    itemUnitStore.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchAnchor(builder:
                (BuildContext buildContext, SearchController controller) {
              return SearchBar(
                controller: controller,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Icon(Icons.search),
              );
            }, suggestionsBuilder:
                (BuildContext context, SearchController controller) {
              String searchString = controller.text.toLowerCase();
              // return List<ListTile>.generate(5, (int index) {
              //   final String item = 'item $index';
              //   return ListTile(
              //     title: Text(item),
              //     onTap: () {
              //       setState(() {
              //         controller.closeView(item);
              //       });
              //     },
              //   );
              List<Product> products = productStore.items
                  .where((product) =>
                      product.name!.toLowerCase().contains(searchString) ||
                      (product.description != null &&
                          product.description!
                              .toLowerCase()
                              .contains(searchString)))
                  .toList();
              products.sort((first, second) => first.name!
                  .toLowerCase()
                  .compareTo(second.name!.toLowerCase()));
              return products.map((product) => ListTile(
                    title: Row(
                      children: [
                        Text(product.name?.truncate(24) ?? ''),
                        const SizedBox(
                          width: 10,
                        ),
                        // Text(
                        //   product.description!,
                        //   style: const TextStyle(fontSize: 12),
                        // ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        Text(
                          '${product.prices.first.pricePerUnit!.convertToShortFormat()} đồng / ${product.prices.first.unitAmount!.removeRedundantDecimal()}${product.prices.first.itemUnit?.alias ?? ' ${product.prices.first.itemUnit?.name}'}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ));
            }),
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                return LoadingIndicator(
                  isLoading: productStore.isListFetching,
                  child: RefreshIndicator(
                      key: GlobalKey<RefreshIndicatorState>(),
                      onRefresh: () async {
                        await productStore.fetchList();
                      },
                      child: _buildProductList()),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton(
        iconSize: MediaQuery.of(context).size.width * 0.11,
        icon: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              builder: (context) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 1,
                    child: const ProductCreateForm());
              });
        },
      ),
    );
  }

  Widget _buildProductList() {
    if (productStore.items.isEmpty) {
      return const Text('Không có sản phẩm');
    }

    return ListView.builder(
      itemCount: productStore.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final Product product = productStore.items[index];
        return ProductItem(product);
      },
    );
  }
}
