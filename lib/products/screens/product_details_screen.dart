import 'dart:io';

import 'package:flutter/material.dart';
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
      ),
      body: Container(),
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
}
