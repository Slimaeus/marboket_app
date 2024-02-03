import 'package:flutter/material.dart';
import 'package:marboket_app/app/extensions/double_extensions.dart';
import 'package:marboket_app/app/extensions/string_extensions.dart';
import 'package:marboket_app/app/managers/route_manager_import.dart';
import 'package:marboket_app/products/models/photo.dart';
import 'package:marboket_app/products/models/price.dart';
import 'package:marboket_app/products/models/product.dart';
import 'package:marboket_app/products/stores/item_unit_store.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem(this.product, {super.key});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late ProductStore productStore;
  late ItemUnitStore itemUnitStore;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productFriendlyUrlNameController =
      TextEditingController();

  // String? selectedItemUnitId;
  @override
  void initState() {
    super.initState();

    productStore = context.read();
    itemUnitStore = context.read();
    itemUnitStore.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.product.id.toString()),
      background: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          child: Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.blue,
                  Colors.purple,
                  Colors.red,
                  Colors.red,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                // stops: [0.0, 1.0],
                tileMode: TileMode.repeated),
          )),
        ),
      ),
      confirmDismiss: (direction) async {
        switch (direction) {
          case DismissDirection.endToStart:
            if (widget.product.id != null && widget.product.id!.isNotEmpty) {
              return await showDialog(
                  context: context,
                  builder: (buildContext) => AlertDialog(
                        alignment: Alignment.center,
                        title: const Text('Xác nhận xóa'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                productStore
                                    .delete(widget.product.id!)
                                    .then((_) {
                                  Navigator.pop(buildContext, true);
                                });
                              },
                              child: const Text('Xác nhận')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(buildContext, false);
                              },
                              child: const Text('Hủy'))
                        ],
                      ));
            }
            break;
          case DismissDirection.startToEnd:
            if (widget.product.id != null && widget.product.id!.isNotEmpty) {
              productStore.fetch(widget.product.id!).then((_) {
                Navigator.pushNamed(context, RouteManager.productDetails);
              });
              // productNameController.text = widget.product.name ?? '';
              // productDescriptionController.text =
              //     widget.product.description ?? '';
              // showDialog(
              //     context: context,
              //     builder: (context) {
              //       return AlertDialog(
              //         alignment: Alignment.center,
              //         title: const Text('Cập nhật sản phẩm'),
              //         content: SingleChildScrollView(
              //           child: Column(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 TextFormField(
              //                   decoration:
              //                       const InputDecoration(labelText: 'Tên'),
              //                   validator: (String? value) {
              //                     if (value == null || value.isEmpty) {
              //                       return 'Cần nhập tên';
              //                     }
              //                     return null;
              //                   },
              //                   controller: productNameController,
              //                 ),
              //                 const SizedBox(
              //                   height: 10,
              //                 ),
              //                 TextFormField(
              //                   decoration:
              //                       const InputDecoration(labelText: 'Mô tả'),
              //                   validator: (String? value) {
              //                     return null;
              //                   },
              //                   controller: productDescriptionController,
              //                 ),

              //               ]),
              //         ),
              //         actions: [
              //           TextButton(
              //             onPressed: () {
              //               Navigator.of(context).pop(); // Đóng dialog
              //             },
              //             child: const Text('Hủy'),
              //           ),
              //           TextButton(
              //             onPressed: () {
              //               Navigator.of(context).pop();
              //               productStore.update(
              //                   widget.product.id!,
              //                   Product(
              //                     name: productNameController.text,
              //                     description:
              //                         productDescriptionController.text,
              //                   ));
              //             },
              //             child: const Text('Cập nhật'),
              //           )
              //         ],
              //       );
              //     });
            }
            return false;
          default:
            break;
        }

        return false;
      },
      onDismissed: (direction) {
        switch (direction) {
          case DismissDirection.endToStart:
            if (widget.product.id != null && widget.product.id!.isNotEmpty) {}
            break;
          default:
            break;
        }
      },
      child: Card(
        elevation: 3,
        shape: const BeveledRectangleBorder(),
        margin: const EdgeInsets.all(8),
        child: ListTile(
          leading: _buildProductImage(widget.product.photos),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.product.name?.truncate(20) ?? ''),
              widget.product.prices.isEmpty
                  ? const Text('')
                  : Text(
                      '${widget.product.prices.first.pricePerUnit!.convertToShortFormat()} đồng')
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.product.description?.truncate(20) ?? ''),
              _buildPriceList(widget.product.prices),
            ],
          ),
          onTap: () {
            // Handle product tap
          },
        ),
      ),
    );
  }

  Widget _buildPriceList(List<Price> prices) {
    if (prices.isEmpty) {
      return const Text('Không có giá');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: prices.map((price) {
        return Text(
            '${price.unitAmount!.removeRedundantDecimal()}${price.itemUnit?.alias ?? ' ${price.itemUnit?.name}'}');
      }).toList(),
    );
  }

  Widget _buildProductImage(List<Photo> photos) {
    if (photos.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          photos.first.url ??
              'https://static.thenounproject.com/png/4974686-200.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Image.network(
        'https://static.thenounproject.com/png/4974686-200.png',
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ); // No image available
    }
  }
}
