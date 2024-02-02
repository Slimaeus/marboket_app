import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marboket_app/app/extensions/string_extensions.dart';
import 'package:marboket_app/products/models/item_unit.dart';
import 'package:marboket_app/products/stores/item_unit_store.dart';
import 'package:marboket_app/products/stores/product_store.dart';
import 'package:provider/provider.dart';

class ProductCreateForm extends StatefulWidget {
  const ProductCreateForm({super.key});

  @override
  State<ProductCreateForm> createState() => _ProductCreateFormState();
}

class _ProductCreateFormState extends State<ProductCreateForm> {
  late ProductStore productStore;
  late ItemUnitStore itemUnitStore;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController productNameController =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController productDescriptionController =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController productFriendlyUrlNameController =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController productPriceController =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController productAmountController =
      TextEditingController.fromValue(TextEditingValue.empty);
  final TextEditingController productPhotoUrlController =
      TextEditingController.fromValue(TextEditingValue.empty);
  String? selectedItemUnitId;

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
        padding: const EdgeInsets.all(16.0),
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
            TextFormField(
              decoration: const InputDecoration(labelText: 'Giá'),
              validator: (String? value) {
                return null;
              },
              controller: productPriceController,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Số lượng'),
              validator: (String? value) {
                return null;
              },
              controller: productAmountController,
            ),

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
            TextFormField(
              decoration: const InputDecoration(labelText: 'Đường dẫn ảnh'),
              validator: (String? value) {
                return null;
              },
              controller: productPhotoUrlController,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  productStore.create({
                    'name': productNameController.text,
                    'description': productDescriptionController.text,
                    'friendlyUrlName':
                        productNameController.text.convertToFriendlyUrlName(),
                    'itemUnitId': int.parse(selectedItemUnitId ?? ""),
                    'unitAmount': double.parse(productAmountController.text),
                    'price': double.parse(productPriceController.text),
                    'photoUrl': productPhotoUrlController.text.isEmpty
                        ? null
                        : productPhotoUrlController.text
                  });
                },
                child: const Text('Tạo sản phẩm'))
          ],
        ),
      ),
    );
  }
}
