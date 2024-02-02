import 'package:flutter/material.dart';
import 'package:marboket_app/app/managers/route_manager_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteManager.productList);
              },
              child: const Text('Đi tới danh sách sản phẩm')),
          const Center(child: Text('Trang chủ')),
        ],
      ),
    );
  }
}
