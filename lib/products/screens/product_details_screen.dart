import 'package:flutter/material.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:provider/provider.dart';

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
    );
  }
}
