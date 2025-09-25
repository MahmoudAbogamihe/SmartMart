import 'package:flutter/material.dart';
import '../providers/products_provider.dart';
import '../widgets/drawer_screen.dart';
import '../widgets/grid_view_form.dart';

// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    final products = productsData.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping'), centerTitle: true),
      drawer: DrawerScreen(productsData: productsData),
      body: GridViewForm(products: products),
    );
  }
}
