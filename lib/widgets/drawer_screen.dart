import 'package:flutter/material.dart';

import '../providers/products_provider.dart';
import '../screens/selected_products_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.productsData});

  final ProductsProvider productsData;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Product Categories',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.android,
              color: productsData.showAndroid ? Colors.green : Colors.grey,
            ),
            title: const Text('Android products'),
            onTap: () {
              productsData.toggleAndroid();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.phone_iphone,
              color: productsData.showIphone ? Colors.blue : Colors.grey,
            ),

            title: const Text('iPhone products'),
            onTap: () {
              productsData.toggleIphone();
            },
          ),
          const Divider(),
          SizedBox(height: 10),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => SelectedProductsScreen()),
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Select Products',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Icon(Icons.arrow_forward, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
