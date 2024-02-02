import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marboket_app/products/models/item_unit.dart';
import 'package:marboket_app/products/models/product.dart';
import 'package:marboket_app/products/stores/item_unit_store.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:provider/provider.dart';

class ProductUpdateForm extends StatefulWidget {
  final Product product;
  const ProductUpdateForm({super.key, required this.product});

  @override
  State<ProductUpdateForm> createState() => _ProductUpdateFormState();
}

class _ProductUpdateFormState extends State<ProductUpdateForm> {
  late ProductStore productStore;
  late ItemUnitStore itemUnitStore;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productFriendlyUrlNameController =
      TextEditingController();
  // final TextEditingController productPriceController = TextEditingController();
  // final TextEditingController productAmountController = TextEditingController();
  // final TextEditingController productPhotoUrlController =
  //     TextEditingController();
  String? selectedItemUnitId;

  handleUpdate() {
    if (widget.product.id != null) {
      return productStore.update(
          widget.product.id ?? '',
          Product(
            name: productNameController.text,
            description: productDescriptionController.text,
          ));
    }
  }

  @override
  void initState() {
    super.initState();

    productStore = context.read();
    itemUnitStore = context.read();
    itemUnitStore.fetchList();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Tên'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Cần nhập tên';
                }
                return null;
              },
              controller: productNameController,
            ),
            // const SizedBox(
            //   height: 100,
            // ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Mô tả'),
              validator: (String? value) {
                return null;
              },
              controller: productDescriptionController,
            ),
            // TextFormField(
            //   decoration: const InputDecoration(labelText: 'Giá'),
            //   validator: (String? value) {
            //     return null;
            //   },
            //   controller: productPriceController,
            // ),
            // TextFormField(
            //   decoration: const InputDecoration(labelText: 'Số lượng'),
            //   validator: (String? value) {
            //     return null;
            //   },
            //   controller: productAmountController,
            // ),

            Observer(builder: (context) {
              return DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Đơn vị'),
                value: selectedItemUnitId,
                onChanged: (String? value) {
                  setState(() {
                    selectedItemUnitId = value;
                  });
                },
                items: itemUnitStore.list.map((ItemUnit itemUnit) {
                  return DropdownMenuItem<String>(
                    value: itemUnit.id.toString(),
                    child: Text(itemUnit.name ?? ''),
                  );
                }).toList(),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Cần chọn đơn vị';
                  }
                  return null;
                },
              );
            }),
            // TextFormField(
            //   decoration: const InputDecoration(labelText: 'Đường dẫn ảnh'),
            //   validator: (String? value) {
            //     return null;
            //   },
            //   controller: productPhotoUrlController,
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //       productStore.create({
            //         'name': productNameController.text,
            //         'description': productDescriptionController.text,
            //         'friendlyUrlName':
            //             productNameController.text.convertToFriendlyUrlName(),
            //         'itemUnitId': int.parse(selectedItemUnitId ?? ""),
            //         'unitAmount': double.parse(productAmountController.text),
            //         'price': double.parse(productPriceController.text),
            //         'photoUrl': productPhotoUrlController.text.isEmpty
            //             ? null
            //             : productPhotoUrlController.text
            //       });
            //     },
            //     child: const Text('Tạo'))
          ],
        ),
      ),
    );
  }
}
