import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marboket_app/app/extensions/double_extensions.dart';
import 'package:marboket_app/products/models/price.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late ProductStore productStore;
  final priceController = TextEditingController();
  final priceAmountController = TextEditingController();
  String? selectedUnitId;

  @override
  void initState() {
    super.initState();

    productStore = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productStore.item.name!),
        actions: [
          if (productStore.item.photos.isNotEmpty)
            IconButton(
              iconSize: MediaQuery.of(context).size.width * 0.11,
              icon: const Icon(Icons.no_photography),
              onPressed: () async {
                productStore.removePhoto(
                    productStore.item.id!, productStore.item.photos.first.id!);
              },
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Product Photo
            if (productStore.item.photos.isNotEmpty)
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(productStore.item.photos.first.url!),
              ),

            // Product Details
            const SizedBox(height: 16),
            _buildDetailTile(title: 'Tên', subtitle: productStore.item.name),
            _buildDetailTile(
                title: 'Mô tả', subtitle: productStore.item.description),
            // Add more details as needed...

            // Prices
            const SizedBox(height: 16),
            _buildPriceTile(productStore.item.prices),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        iconSize: MediaQuery.of(context).size.width * 0.11,
        icon: const Icon(Icons.add_a_photo_rounded),
        onPressed: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.camera);
          if (image == null) return;
          final file = File(image.path);

          productStore.addPhoto(productStore.item.id!, file);
        },
      ),
    );
  }

  Widget _buildDetailTile({required String title, required String? subtitle}) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle ?? ''),
    );
  }

  Widget _buildPriceTile(List<Price> prices) {
    return ListTile(
      title: const Text(
        'Giá',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: prices.map((price) {
          return ListTile(
            title: Text(
              '${price.pricePerUnit!.convertToShortFormat()} đồng / ${price.unitAmount!.removeRedundantDecimal()}${price.itemUnit?.alias ?? ' ${price.itemUnit?.name}'}',
              style: TextStyle(
                  color: price.isActive != null && price.isActive!
                      ? Colors.green
                      : Colors.red),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                priceController.text =
                    price.pricePerUnit!.removeRedundantDecimal();
                priceAmountController.text =
                    price.unitAmount!.removeRedundantDecimal();
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        alignment: Alignment.center,
                        title: const Text('Cập nhật sản phẩm'),
                        content: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: 'Giá'),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Cần nhập giá';
                                    }
                                    return null;
                                  },
                                  controller: priceController,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Số lượng'),
                                  validator: (String? value) {
                                    return null;
                                  },
                                  controller: priceAmountController,
                                ),
                              ]),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Đóng dialog
                            },
                            child: const Text('Hủy'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              // productStore.update(
                              //     widget.product.id!,
                              //     Product(
                              //       name: productNameController.text,
                              //       description:
                              //           productDescriptionController.text,
                              //     ));
                            },
                            child: const Text('Cập nhật'),
                          )
                        ],
                      );
                    });
              },
              child: const Text(
                'Cập nhật',
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
